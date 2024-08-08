local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	show_new_tab_button_in_tab_bar = false,
	window_padding = { left = "0.1cell", right = "0.1cell", top = 0, bottom = 0 },
	default_prog = { "/bin/zsh", "-l" },
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
			background = "transparent",
			inactive_tab_edge = "rgba(28, 28, 28, 0.9)",
			active_tab = {
				bg_color = "transparent",
				fg_color = "#8FBCBB",
			},
			inactive_tab = {
				bg_color = "transparent",
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
