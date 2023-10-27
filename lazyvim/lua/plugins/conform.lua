return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {
    formatters_by_ft = {
      python = { "ruff_format", "ruff_lint" },
      javascript = { { "prettierd", "prettier" } },
      rust = { "rustfmt" },
    },
  },
}
