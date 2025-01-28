return {
	{
		"yetone/avante.nvim",
		lazy = true,
		event = "VeryLazy",
		build = LazyVim.is_win() and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
			or "make",
		opts = {
			provider = "openai",
			auto_suggestions_provider = "openai",
			openai = {
				model = "gpt-4o",
			},
			hints = { enabled = false },
			file_selector = {
				provider = "snacks",
				provider_opts = {},
			},
		},
		dependencies = {
			{
				"MeanderingProgrammer/render-markdown.nvim",
				ft = function(_, ft)
					vim.list_extend(ft, { "Avante" })
				end,
			},
			{
				"folke/which-key.nvim",
				opts = {
					spec = {
						{ "<leader>a", group = "ai" },
					},
				},
			},
		},
	},
	{
		"stevearc/dressing.nvim",
		lazy = true,
		opts = {
			input = { enabled = false },
			select = { enabled = false },
		},
	},
	{
		"saghen/blink.compat",
		lazy = true,
		opts = {},
		config = function()
			-- monkeypatch cmp.ConfirmBehavior for Avante
			require("cmp").ConfirmBehavior = {
				Insert = "insert",
				Replace = "replace",
			}
		end,
	},
	{
		"saghen/blink.cmp",
		lazy = true,
		opts = {
			sources = {
				default = { "avante_commands", "avante_mentions", "avante_files" },
				providers = {
					avante_commands = {
						name = "avante_commands",
						module = "blink.compat.source",
						score_offset = 90, -- show at a higher priority than lsp
						opts = {},
					},
					avante_files = {
						name = "avante_commands",
						module = "blink.compat.source",
						score_offset = 100, -- show at a higher priority than lsp
						opts = {},
					},
					avante_mentions = {
						name = "avante_mentions",
						module = "blink.compat.source",
						score_offset = 1000, -- show at a higher priority than lsp
						opts = {},
					},
				},
			},
		},
	},
}
