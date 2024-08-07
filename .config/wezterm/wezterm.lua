local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	window_padding = {
		left = 2,
		right = 2,
		top = 0,
		bottom = 0,
	},
	wezterm.on("update-status", function(window, pane)
		-- Workspace name
		local stat = window:active_workspace()
		local stat_color = "#b74e58"
		-- It's a little silly to have workspace name all the time
		-- Utilize this to display LDR or current key table name
		if window:active_key_table() then
			stat = window:active_key_table()
			stat_color = "#88c0d0"
		end
		if window:leader_is_active() then
			stat = "LDR"
			stat_color = "#a97ea1"
		end

		local basename = function(s)
			-- Nothing a little regex can't fix
			return string.gsub(s, "(.*[/\\])(.*)", "%2")
		end

		-- Current working directory
		local cwd = pane:get_current_working_dir()
		if cwd then
			if type(cwd) == "userdata" then
				-- Wezterm introduced the URL object in 20240127-113634-bbcac864
				cwd = basename(cwd.file_path)
			else
				-- 20230712-072601-f4abf8fd or earlier version
				cwd = basename(cwd)
			end
		else
			cwd = ""
		end

		-- Current command
		local cmd = pane:get_foreground_process_name()
		-- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l)
		cmd = cmd and basename(cmd) or ""

		-- Left status (left of the tab line)
		window:set_left_status(wezterm.format({
			{ Foreground = { Color = stat_color } },
			{ Text = "  " },
			{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
			{ Text = "  " },
		}))

		-- Right status
		window:set_right_status(wezterm.format({
			-- Wezterm has a built-in nerd fonts
			-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
			{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
			{ Text = " | " },
			{ Foreground = { Color = "#e7c173" } },
			{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
			"ResetAttributes",
			{ Text = "  " },
		}))
	end),

	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font_size = 13,
	colors = {
		foreground = "#D8DEE9",
		background = "#282f3b",
		cursor_bg = "#D8DEE9",
		cursor_border = "#D8DEE9",
		cursor_fg = "#282f3b",
		selection_fg = "#D8DEE9",
		selection_bg = "#2E3440",
		tab_bar = {
			background = "#191D24",
			inactive_tab_edge = "rgba(28, 28, 28, 0.9)",
			active_tab = {
				bg_color = "#8FBCBB",
				fg_color = "#282f3b",
			},
			inactive_tab = {
				bg_color = "#282f3b",
				fg_color = "#D8DEE9",
			},
			inactive_tab_hover = {
				bg_color = "#282f3b",
				fg_color = "#D8DEE9",
			},
		},
		ansi = {
			"#191D24",
			"#BF616A",
			"#A3BE8C",
			"#EBCB8B",
			"#81A1C1",
			"#B48EAD",
			"#8FBCBB",
			"#D8DEE9",
		},
		brights = {
			"#3B4252",
			"#D06F79",
			"#B1D196",
			"#F0D399",
			"#88C0D0",
			"#C895BF",
			"#93CCDC",
			"#E5E9F0",
		},
	},
	inactive_pane_hsb = {
		saturation = 0.6,
		brightness = 0.6,
	},
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		-- Send C-a when pressing C-a twice
		{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
		{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },

		-- Pane keybindings
		{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
		{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },
		{ key = "H", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "J", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "L", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 5 }) },

		-- Tab keybindings
		{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
		{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
		{ key = "n", mods = "LEADER", action = act.ShowTabNavigator },
		{
			key = "e",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = wezterm.format({
					{ Attribute = { Intensity = "Bold" } },
					{ Foreground = { AnsiColor = "Fuchsia" } },
					{ Text = "Renaming Tab Title...:" },
				}),
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		-- Workspace
		{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	},
}
return config
