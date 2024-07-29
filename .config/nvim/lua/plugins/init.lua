return {
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",
	"tpope/vim-sleuth",
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		init = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = { "bold" },
					keywords = { "italic" },
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = { "bold" },
					operators = { "bold" },
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					treesitter = true,
					notify = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
			})

			-- setup must be called before loading
			vim.cmd("colorscheme catppuccin")
		end,
	},
}
