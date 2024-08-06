local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font_size = 12.5,
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
}
return config
