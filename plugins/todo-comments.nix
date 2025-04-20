{
  plugins.todo-comments = {
    enable = true;
    settings = {
      signs = true;
      keywords = {
        FIX = {
          icon = "";
          color = "error";
          alt = [ "FIXME" "BUG" "FIXIT" "ISSUE" ];
        };
        TODO = { icon = "󰸞"; color = "info"; };
        HACK = { icon = "󰈸"; color = "warning"; };
        WARN = { icon = ""; color = "warning"; alt = [ "WARNING" "XXX" ]; };
        PERF = { icon = "󰔛"; color = "info"; alt = [ "OPTIM" "PERFORMANCE" "OPTIMIZE" ]; };
        TEST = { icon = ""; color = "warning"; };
        NOTE = { icon = ""; color = "hint"; alt = [ "INFO" ]; };
      };
      colors = {
        error = [ "DiagnosticError" "ErrorMsg" "#ff6578" ];
        warning = [ "DiagnosticWarn" "WarningMsg" "#eacb64" ];
        info = [ "DiagnosticInfo" "#72cce8" ];
        hint = [ "DiagnosticHint" "#9dd274" ];
        default = [ "Identifier" "#9CA3AF" ];
      };
      sign_priority = 8;
      merge_keywords = true;
    };
  };
}
