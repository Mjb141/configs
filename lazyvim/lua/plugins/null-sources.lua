return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("none-ls")
    return {
      root_dir = require("none-ls.utils").root_pattern(".none-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        nls.builtins.diagnostics.ruff,
        nls.builtins.formatting.black,
        nls.builtins.formatting.prettierd,
      },
    }
  end,
}
