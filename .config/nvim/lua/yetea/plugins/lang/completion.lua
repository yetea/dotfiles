return {
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			"luckasRanarison/tailwind-tools.nvim", -- Add this dependency
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			luasnip.config.setup({})

			-- `/` cmdline setup.
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- `:` cmdline setup.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})

			cmp.setup({
				window = {
					border = "rounded",
					completion = cmp.config.window.bordered({
						winhighlight = "Normal:Pmenu,FloatBorder:SpecialCmpBorder,Search:None",
						scrollbar = true,
						border = "rounded",
						col_offset = -1,
						side_padding = 0,
					}),
					documentation = cmp.config.window.bordered({
						winhighlight = "Normal:Pmenu,FloatBorder:SpecialCmpBorder,Search:None",
						scrollbar = true,
						border = "rounded",
					}),
				},
				view = {
					entries = "custom",
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					expandable_indicator = true,
					format = lspkind.cmp_format({
						before = require("tailwind-tools.cmp").lspkind_format, -- Enable tailwind-tools formatting
						mode = "symbol_text",
						maxwidth = 50,
						menu = {
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							path = "[Path]",
							codeium = "[Codeium]",
						},
					}),
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { border = "rounded", completeopt = "menu,menuone,noinsert" },
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),

					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),

					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{
						name = "lazydev",
						group_index = 0,
					},
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "codeium", max_item_count = 3 },
				},
			})
		end,
}
