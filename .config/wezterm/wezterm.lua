local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- General Settings
config.automatically_reload_config = true
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.line_height = 1.1
config.tab_max_width = 60
config.tab_bar_at_bottom = false
config.default_prog = { "/bin/zsh", "-l" }
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.window_padding = { left = 2, right = 2, top = 0, bottom = 0 }

-- Font Settings
config.font_size = 13
config.underline_thickness = 1
config.underline_position = -3.0
config.freetype_load_target = "Normal"
config.bold_brightens_ansi_colors = false

config.warn_about_missing_glyphs = false
config.font = wezterm.font({
  family = "JetBrainsMono Nerd Font",
  weight = "Medium",
})

config.colors = {
  foreground = "#D8DEE9",
  background = "#242933",
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
}
config.colors.cursor_bg = config.colors.foreground
config.colors.cursor_border = config.colors.foreground
config.colors.split = config.colors.foreground

config.anti_alias_custom_block_glyphs = true
config.custom_block_glyphs = true

local gpus = wezterm.gui.enumerate_gpus()
config.webgpu_preferred_adapter = gpus[1]
config.front_end = "OpenGL"

return config
