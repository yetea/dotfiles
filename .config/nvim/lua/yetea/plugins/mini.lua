return {
	"echasnovski/mini.nvim",
	event = "BufEnter",
	keys = {
		{
			"<leader>e",
			function()
				require("mini.files").open(vim.api.nvim_buf_get_name(0))
			end,
			desc = "Find Manualy",
		},
		{
			"<leader>j",
			function()
				require("mini.splitjoin").toggle()
			end,
			desc = "Splitjoin Toggle",
		},
		{
			"<leader>ff",
			function()
				require("mini.pick").builtin.files()
			end,
			desc = "Mini Find Files",
		},
		{
			"<leader>fg",
			function()
				require("mini.pick").builtin.grep_live()
			end,
			desc = "Mini Search in Files",
		},
		{
			"<leader>bl",
			function()
				require("mini.pick").builtin.buffers()
			end,
			desc = "List all buffers",
		},
		{
			"<leader>ss",
			function()
				local input = vim.fn.input("Session Name: ")
				if input ~= "" then
					require("mini.sessions").write(input)
					print('Session "' .. input .. '" saved.')
				else
					print("Session name cannot be empty.")
				end
			end,
			desc = "Save current session",
		},
		{
			"<leader>sd",
			function()
				local input = vim.fn.input("Session Name to Delete: ")
				if input ~= "" then
					require("mini.sessions").delete(input, { force = true, verbose = true })
					print('Session "' .. input .. '" deleted.')
				else
					print("Session name cannot be empty.")
				end
			end,
			desc = "Delete a session",
		},
		{
			"<leader>sr",
			function()
				require("mini.sessions").select("read", {})
			end,
			desc = "Select and read a session",
		},
	},
	config = function()
		require("mini.ai").setup()
		require("mini.basics").setup({
			options = {
				basic = true,
				extra_ui = true,
				win_borders = "double",
			},
			mappings = {
				basic = true,
				windows = true,
			},
			autocommands = {
				basic = true,
				relnum_in_visual_mode = true,
			},
		})
		require("mini.bracketed").setup()
		require("mini.bufremove").setup()
		require("mini.clue").setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				{ mode = "n", keys = "\\" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				{ mode = "n", keys = "<Leader>b", desc = " Buffer" },
				{ mode = "n", keys = "<Leader>f", desc = " Find" },
				{ mode = "n", keys = "<Leader>g", desc = "󰊢 Git" },
				{ mode = "n", keys = "<Leader>i", desc = "󰏪 Insert" },
				{ mode = "n", keys = "<Leader>l", desc = "󰘦 LSP" },
				{ mode = "n", keys = "<Leader>q", desc = " NVim" },
				{ mode = "n", keys = "<Leader>s", desc = "󰆓 Session" },
				{ mode = "n", keys = "<Leader>u", desc = "󰔃 UI" },
				{ mode = "n", keys = "<Leader>w", desc = " Window" },
				require("mini.clue").gen_clues.g(),
				require("mini.clue").gen_clues.builtin_completion(),
				require("mini.clue").gen_clues.marks(),
				require("mini.clue").gen_clues.registers(),
				require("mini.clue").gen_clues.windows(),
				require("mini.clue").gen_clues.z(),
			},
			window = {
				delay = 300,
			},
		})

		require("mini.cursorword").setup()
		require("mini.extra").setup()
		require("mini.files").setup({
			windows = {
				preview = true,
				width_preview = 80,
			},
		})
		require("mini.hipatterns").setup({
			tailwind = {
				enabled = true,
				ft = {
					"astro",
					"css",
					"heex",
					"html",
					"html-eex",
					"javascript",
					"javascriptreact",
					"rust",
					"svelte",
					"typescript",
					"typescriptreact",
					"vue",
				},
				-- full: the whole css class will be highlighted
				-- compact: only the color will be highlighted
				style = "full",
			},
			highlighters = {

				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				-- Highlight hex color strings (`#rrggbb`)
				shorthand = {
					pattern = "()#%x%x%x()%f[^%x%w]",
					group = function(_, _, data)
						---@type string
						local match = data.full_match
						local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
						local hex_color = "#" .. r .. r .. g .. g .. b .. b

						return require("mini.hipatterns").compute_hex_color_group(hex_color, "bg")
					end,
					extmark_opts = { priority = 2000 },
				},
				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
			},
		})
		require("mini.indentscope").setup({
			draw = {
				animation = function()
					return 1
				end,
			},
			symbol = "┆",
		})
		require("mini.jump").setup()
		require("mini.jump2d").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.operators").setup()
		local win_config = function()
			local height = math.floor(0.618 * vim.o.lines)
			local width = math.floor(0.3 * vim.o.columns)
			return {
				anchor = "NW",
				height = height,
				width = width,
				row = 0,
				col = math.floor(0.5 * (vim.o.columns - width)),
			}
		end
		require("mini.pick").setup({
			window = {
				config = win_config,
				prompt_cursor = "▏",
				prompt_prefix = " ",
			},
		})
		require("mini.splitjoin").setup()
		require("mini.starter").setup({
			items = {
				require("mini.starter").sections.builtin_actions(),
				require("mini.starter").sections.recent_files(5, false),
				require("mini.starter").sections.recent_files(5, true),
				require("mini.starter").sections.sessions(5, true),
			},
			header = [[
                ███╗   ███╗██╗   ██╗██╗███╗   ███╗
                ████╗ ████║██║   ██║██║████╗ ████║
                ██╔████╔██║██║   ██║██║██╔████╔██║
                ██║╚██╔╝██║╚██╗ ██╔╝██║██║╚██╔╝██║
                ██║ ╚═╝ ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
                ██║     ██║  ╚═══╝  ╚═╝██║     ██║
                ██║     ██║ini      nvi██║     ██║
                ╚═╝     ╚═╝            ╚═╝     ╚═╝]],
			footer = function()
				local stats = require("lazy.stats").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				return "Startup Time: " .. ms .. " ms"
			end,
		})
		require("mini.sessions").setup({
			autowrite = true,
			hooks = {
				pre = {
					write = function()
						vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
					end,
				},
			},
		})

		require("mini.animate").setup({
			scroll = {
				enable = false,
			},
			cursor = {
				timing = require("mini.animate").gen_timing.cubic({ duration = 50, unit = "total" }),
			},
		})
		require("mini.surround").setup()
		require("mini.trailspace").setup()
		-- require("mini.tabline").setup()
		require("mini.visits").setup()
	end,
}
