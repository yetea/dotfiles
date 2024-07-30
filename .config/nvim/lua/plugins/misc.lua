return {
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
	{
		"AckslD/muren.nvim",
		opts = {},
		keys = {
			{ "<leader>rm", "<cmd>MurenOpen<cr>", desc = "Toggle Muren" },
		},
	},
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {}, -- your configuration
	},
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"mg979/vim-visual-multi",
		-- See https://github.com/mg979/vim-visual-multi/issues/241
		init = function()
			vim.g.VM_default_mappings = 0
			vim.g.VM_maps = {
				["Find Under"] = "",
			}
			vim.g.VM_add_cursor_at_pos_no_mappings = 1
		end,
	},
	{
		"cjodo/convert.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>cf", "<cmd>ConvertFindNext<CR>", desc = "Find next convertable unit" },
			{ "<leader>ci", "<cmd>ConvertFindCurrent<CR>", desc = "Find convertable unit in current line" },
			{ "<leader>cx", "<cmd>ConvertAll<CR>", desc = "Convert all of a specified unit" },
		},
	},
	{
		"MysticalDevil/inlay-hints.nvim",
		event = "LspAttach",
		dependencies = { "neovim/nvim-lspconfig" },

		init = function()
			require("inlay-hints").setup()
		end,
	},
	{
		"tris203/precognition.nvim",
		--event = "VeryLazy",
		opts = {
			-- startVisible = true,
			-- showBlankVirtLine = true,
			-- highlightColor = { link = "Comment" },
			-- hints = {
			--      Caret = { text = "^", prio = 2 },
			--      Dollar = { text = "$", prio = 1 },
			--      MatchingPair = { text = "%", prio = 5 },
			--      Zero = { text = "0", prio = 1 },
			--      w = { text = "w", prio = 10 },
			--      b = { text = "b", prio = 9 },
			--      e = { text = "e", prio = 8 },
			--      W = { text = "W", prio = 7 },
			--      B = { text = "B", prio = 6 },
			--      E = { text = "E", prio = 5 },
			-- },
			-- gutterHints = {
			--     G = { text = "G", prio = 10 },
			--     gg = { text = "gg", prio = 9 },
			--     PrevParagraph = { text = "{", prio = 8 },
			--     NextParagraph = { text = "}", prio = 8 },
			-- },
			-- disabled_fts = {
			--     "startify",
			-- },
		},
	},
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				line_num = {
					enable = true,
				},
				blank = {
					enable = true,
					chars = {
						"․",
					},
					style = {
						{ vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"), "" },
					},
				},
			})
		end,
	},
	{
		"piersolenski/wtf.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {},
		keys = {
			{
				"<leader>gw",
				mode = { "n", "x" },
				function()
					require("wtf").ai()
				end,
				desc = "Debug diagnostic with AI",
			},
			{
				mode = { "n" },
				"<leader>gW",
				function()
					require("wtf").search()
				end,
				desc = "Search diagnostic with Google",
			},
		},
	},
	{
		"vuki656/package-info.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		keys = {
			{
				"<leader>ns",
				function()
					require("package-info").show()
				end,
				desc = "Show dependency versions",
				silent = true,
				noremap = true,
			},
			{
				"<leader>nc",
				function()
					require("package-info").hide()
				end,
				desc = "Hide dependency versions",
				silent = true,
				noremap = true,
			},
			{
				"<leader>nt",
				function()
					require("package-info").toggle()
				end,
				desc = "Toggle dependency versions",
				silent = true,
				noremap = true,
			},
			{
				"<leader>nu",
				function()
					require("package-info").update()
				end,
				desc = "Update dependency on the line",
				silent = true,
				noremap = true,
			},
			{
				"<leader>nd",
				function()
					require("package-info").delete()
				end,
				desc = "Delete dependency on the line",
				silent = true,
				noremap = true,
			},
			{
				"<leader>ni",
				function()
					require("package-info").install()
				end,
				desc = "Install a new dependency",
				silent = true,
				noremap = true,
			},
			{
				"<leader>np",
				function()
					require("package-info").change_version()
				end,
				desc = "Install a different dependency version",
				silent = true,
				noremap = true,
			},
		},
	},
}
