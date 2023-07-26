return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  config = true,
  event = "VeryLazy",
  keys = {
    { "<leader>v", desc = "Venv" },
    { "<leader>vs", "<cmd>:VenvSelect<cr>", desc = "Select Venv" },
  },
}
