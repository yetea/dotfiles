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
			{ "<leader>toi", "<cmd>TSToolsOrganizeImports<cr>", desc = "Sorts and removes unused imports" },
			{ "<leader>tsi", "<cmd>TSToolsSortImports<cr>", desc = "Sorts imports" },
			{ "<leader>tri", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "Removes unused imports" },
			{ "<leader>tru", "<cmd>TSToolsRemoveUnused<cr>", desc = "Removes all unused statements" },
			{
				"<leader>tami",
				"<cmd>TSToolsAddMissingImports<cr>",
				desc = "Adds imports for all statements that lack one and can be imported",
			},
			{ "<leader>tfa", "<cmd>TSToolsFixAll<cr>", desc = "Fixes all fixable errors" },
			{
				"<leader>tgd",
				"<cmd>TSToolsGoToSourceDefinition<cr>",
				desc = "Goes to source definition",
			},
			{
				"<leader>trf",
				"<cmd>TSToolsRenameFile<cr>",
				desc = "Allow to rename current file and apply changes to connected files",
			},
			{
				"<leader>tfr",
				"<cmd>TSToolsFileReferences<cr>",
				desc = "Find files that reference the current file",
			},
		},
		init = function()
			require("typescript-tools").setup({})
		end,
	},
}
