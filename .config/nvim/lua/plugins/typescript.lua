return {
	{
		"dmmulroy/ts-error-translator.nvim",
		init = function()
			require("ts-error-translator").setup()
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		keys = {
			{ "<leader>ts", "<cmd>TypescriptOrganizeImports<cr>", desc = "Organize Imports" },
			{ "<leader>tR", "<cmd>TypescriptRenameFile<cr>", desc = "Rename File" },
			{ "<leader>tu", "<cmd>TypescriptUpdateProject<cr>", desc = "Update Project" },
			{ "<leader>tI", "<cmd>TypescriptAddMissingImports<cr>", desc = "Add Missing Imports" },
			{ "<leader>td", "<cmd>TypescriptRemoveUnused<cr>", desc = "Remove Unused" },
			{ "<leader>tr", "<cmd>TypescriptRemoveUnused<cr>", desc = "Remove Unused" },
			{ "<leader>tR", "<cmd>TypescriptRenameFile<cr>", desc = "Rename File" },
		},
		init = function()
			require("typescript-tools").setup({
				settings = {
					tsserver_file_preferences = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayVariableTypeHintsWhenTypeMatchesName = false,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
			})
		end,
	},
}
