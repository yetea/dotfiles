return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"css",
				"diff",
				"dockerfile",
				"gitignore",
				"html",
				"javascript",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
}
