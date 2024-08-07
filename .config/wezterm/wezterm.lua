local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font_size = 13,
	colors = {
		foreground = "#D8DEE9",
		background = "#242933",
		cursor_bg = "#D8DEE9",
		cursor_border = "#D8DEE9",
		cursor_fg = "#242933",
		selection_fg = "#D8DEE9",
		selection_bg = "#2E3440",

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
		saturation = 0.24,
		brightness = 0.5,
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
	},
}
return config
