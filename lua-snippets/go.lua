local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local f = ls.function_node
local postfix = require("luasnip.extras.postfix").postfix

-- Captures the Go expression to the left of a postfix trigger. Includes
-- parens/brackets/derefs so calls like `client.Do(req)` and `&foo.bar[0]`
-- are matched whole rather than chopped at the first non-word character.
local go_expr_pattern = "[%w%.%_%-%(%)%[%]%&%*]+$"

-- Treesitter Go grammar node kinds whose zero value is `nil`. `qualified_type`
-- (e.g. `context.Context`) is included because the common cases are interfaces;
-- concrete struct types like `time.Time` need manual correction.
local pointery_kinds = {
  pointer_type = true,
  slice_type = true,
  map_type = true,
  channel_type = true,
  interface_type = true,
  function_type = true,
  qualified_type = true,
}

local function zero_value(type_node, bufnr)
  if not type_node then return "nil" end
  local kind = type_node:type()
  if pointery_kinds[kind] then return "nil" end
  local text = vim.treesitter.get_node_text(type_node, bufnr)
  if kind == "type_identifier" then
    -- `err` (not `nil`) so the snippet plays nicely with a preceding `iferr`.
    if text == "error" then return "err" end
    if text == "string" then return '""' end
    if text == "bool" then return "false" end
    if text == "any" then return "nil" end
    if text:match("^u?int") or text:match("^float")
        or text == "byte" or text == "rune" or text == "uintptr"
        or text == "complex64" or text == "complex128" then
      return "0"
    end
    return text .. "{}"
  end
  if kind == "generic_type" or kind == "array_type" or kind == "struct_type" then
    return text .. "{}"
  end
  return "nil"
end

-- Walk up from the cursor to the innermost enclosing function-like scope.
-- `func_literal` is matched first for closures, so the snippet adapts to the
-- closure's signature rather than the outer function's.
local function enclosing_result()
  local node = vim.treesitter.get_node()
  while node do
    local k = node:type()
    if k == "function_declaration" or k == "method_declaration" or k == "func_literal" then
      local fields = node:field("result")
      return fields[1]
    end
    node = node:parent()
  end
  return nil
end

-- A bare single return (`func f() error`) parses as the type node directly;
-- only parenthesised lists wrap children in a `parameter_list`.
local function result_types(result_node)
  if not result_node then return {} end
  if result_node:type() == "parameter_list" then
    local out = {}
    for child in result_node:iter_children() do
      if child:type() == "parameter_declaration" then
        local typ = child:field("type")
        if typ[1] then table.insert(out, typ[1]) end
      end
    end
    return out
  end
  return { result_node }
end

local function build_returns()
  local bufnr = vim.api.nvim_get_current_buf()
  local types = result_types(enclosing_result())
  if #types == 0 then
    return sn(nil, { t("return") })
  end
  local nodes = { t("return ") }
  for idx, type_node in ipairs(types) do
    if idx > 1 then table.insert(nodes, t(", ")) end
    table.insert(nodes, i(idx, zero_value(type_node, bufnr)))
  end
  return sn(nil, nodes)
end

-- Body for the `err != nil` guard. `iferr` and `ifer` share it.
local function iferr_nodes()
  return {
    t({ "if err != nil {", "\t" }),
    d(1, build_returns),
    t({ "", "}", "" }), i(0),
  }
end

return {
  -- `ret` — bare context-aware return. Same machinery as `ifn`/`iferr`, just
  -- without a surrounding guard.
  s("ret", { d(1, build_returns), i(0) }),

  -- `ifn` — nil guard. The `d` node re-runs `build_returns` on every
  -- expansion, so the inserted `return ...` reflects the enclosing function's
  -- current signature.
  s("ifn", {
    t("if "), i(1, "x"), t({ " == nil {", "\t" }),
    d(2, build_returns),
    t({ "", "}", "" }), i(0),
  }),

  -- `iferr` / `ifer` — the canonical Go error guard, but the returned values
  -- match the enclosing function's signature instead of a hard-coded `err`.
  s("iferr", iferr_nodes()),
  s("ifer", iferr_nodes()),

  -- `expr.print` → `fmt.Println(expr)` for quick debug prints.
  postfix({ trig = ".print", match_pattern = go_expr_pattern }, {
    t("fmt.Println("),
    f(function(_, parent) return parent.snippet.env.POSTFIX_MATCH end),
    t(")"), i(0),
  }),
}
