local function fmt_mode(s)
	local mode_map = {
		["COMMAND"] = "COMMND",
		["V-BLOCK"] = "VBLOCK",
		["TERMINAL"] = "TERMNL",
		["V-REPLACE"] = "VREPLC",
		["O-PENDING"] = "0PNDNG",
	}
	return mode_map[s] or s
end

local function get_recording_icon()
	return vim.fn.reg_recording() ~= "" and " " or "  "
end

local function get_recording_color()
	local red = "#BF616A"
	local text_hl = { fg = "#D8DEE9" }
	return { fg = vim.fn.reg_recording() ~= "" and red or text_hl.fg }
end

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local function file_path_with_icon()
	local file_path = vim.fn.expand("%:p:h:t") .. "/" .. vim.fn.expand("%:t")
	return " " .. file_path
end

local function current_buffer_lsp()
	local buf_ft = vim.bo.filetype
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return ""
	end

	local current_clients = ""
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			current_clients = current_clients .. client.name .. " "
		end
	end
	return current_clients
end
vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
local git_blame = require("gitblame")

-- Main configuration
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			local text_hl = { fg = "#D8DEE9" }
			local icon_hl = { fg = "#88C0D0" }

			require("lualine").setup({
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = fmt_mode,
							icon = { "" },
							separator = { right = " ", left = "" },
						},
					},
					lualine_b = {},
					lualine_c = {
						{
							file_path_with_icon,
							color = text_hl,
							separator = "",
							padding = { left = 1, right = 0 },
						},
						{
							get_recording_icon,
							color = get_recording_color,
							padding = 0,
							separator = "",
						},
						{
							"branch",
							color = text_hl,
							icon = { " ", color = icon_hl },
							separator = "",
							padding = 0,
						},
						{
							"diff",
							color = text_hl,
							icon = { "  ", color = text_hl },
							source = diff_source,
							symbols = {
								added = " ",
								modified = " ",
								removed = " ",
							},
							diff_color = {
								added = icon_hl,
								modified = icon_hl,
								removed = icon_hl,
							},
							padding = 0,
						},
					},
					lualine_x = {
						{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							symbols = {
								error = " ",
								warn = " ",
								info = " ",
								hint = "󱤅 ",
								other = "󰠠 ",
							},
							colored = true,
							padding = 2,
						},
						{
							current_buffer_lsp,
							padding = 1,
							color = text_hl,
							icon = { " ", color = icon_hl },
						},
					},
					lualine_y = {},
					lualine_z = {
						{
							"location",
							icon = { "", align = "left" },
						},
						{
							"progress",
							icon = { "", align = "left" },
							separator = { right = "", left = "" },
						},
					},
				},
				options = {
					disabled_filetypes = { "dashboard" },
					globalstatus = true,
					section_separators = { left = " ", right = " " },
					component_separators = { left = "", right = "" },
					theme = "nordic",
				},
			})

			vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
				callback = function(_)
					require("lualine").setup({})
				end,
				pattern = { "*.*" },
				once = true,
			})
		end,
	},
}
