local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- General Settings
config.automatically_reload_config = true
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.line_height = 1.1
config.tab_max_width = 60
config.default_prog = { "/bin/zsh", "-l" }
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.window_padding = { left = 8, right = 8, top = 0, bottom = 0 }

-- Font Settings
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 13

-- Color Scheme
config.colors = {
  foreground = "#D8DEE9",
  background = "#242933",
  cursor_bg = "#D8DEE9",
  cursor_border = "#D8DEE9",
  cursor_fg = "#282f3b",
  selection_fg = "#D8DEE9",
  selection_bg = "#2E3440",
  tab_bar = {
    background = '#191d24',
    active_tab = {
      bg_color = "#434c5e",
      fg_color = "#eceff4",
    },
    inactive_tab = {
      bg_color = "transparent",
      fg_color = "#D8DEE9",
    },
  },
  ansi = {
    "#191D24", "#BF616A", "#A3BE8C", "#EBCB8B",
    "#81A1C1", "#B48EAD", "#8FBCBB", "#D8DEE9",
  },
  brights = {
    "#3B4252", "#D06F79", "#B1D196", "#F0D399",
    "#88C0D0", "#C895BF", "#93CCDC", "#E5E9F0",
  },
}

-- Inactive Pane Settings
config.inactive_pane_hsb = {
  saturation = 0.6,
  brightness = 0.6,
}

-- Keybindings

-- Leader Key Configuration
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

-- Copy Mode Keybinding
config.keys = {
  { key = "a",          mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
  { key = "c",          mods = "LEADER",      action = act.ActivateCopyMode },
  { key = "phys:Space", mods = "LEADER",      action = act.ActivateCommandPalette },

  -- Pane Keybindings
  { key = "-",          mods = "LEADER",      action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "|",          mods = "LEADER",      action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "h",          mods = "LEADER",      action = act.ActivatePaneDirection("Left") },
  { key = "j",          mods = "LEADER",      action = act.ActivatePaneDirection("Down") },
  { key = "k",          mods = "LEADER",      action = act.ActivatePaneDirection("Up") },
  { key = "l",          mods = "LEADER",      action = act.ActivatePaneDirection("Right") },
  { key = "q",          mods = "LEADER",      action = act.CloseCurrentPane({ confirm = true }) },
  { key = "z",          mods = "LEADER",      action = act.TogglePaneZoomState },
  { key = "o",          mods = "LEADER",      action = act.RotatePanes("Clockwise") },
  { key = "H",          mods = "LEADER",      action = act.AdjustPaneSize({ "Left", 5 }) },
  { key = "J",          mods = "LEADER",      action = act.AdjustPaneSize({ "Down", 5 }) },
  { key = "K",          mods = "LEADER",      action = act.AdjustPaneSize({ "Up", 5 }) },
  { key = "L",          mods = "LEADER",      action = act.AdjustPaneSize({ "Right", 5 }) },

  -- Tab Keybindings
  { key = "t",          mods = "LEADER",      action = act.SpawnTab("CurrentPaneDomain") },
  { key = "[",          mods = "LEADER",      action = act.ActivateTabRelative(-1) },
  { key = "]",          mods = "LEADER",      action = act.ActivateTabRelative(1) },
  { key = "n",          mods = "LEADER",      action = act.ShowTabNavigator },
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

  -- Workspace Keybinding
  { key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}

local function get_current_working_dir(tab)
  local current_dir = tab.active_pane and tab.active_pane.current_working_dir or { file_path = '' }
  local HOME_DIR = string.format('file://%s', os.getenv('HOME'))

  return current_dir == HOME_DIR and '.'
      or string.gsub(current_dir.file_path, '(.*[/\\])(.*)', '%2')
end

wezterm.on('format-tab-title', function(tab)
  local index = tonumber(tab.tab_index) + 1
  local custom_title = tab.tab_title
  local title = get_current_working_dir(tab)

  if custom_title and #custom_title > 0 then
    title = custom_title
  end

  return string.format('  %s - %s  ', index, title)
end)

wezterm.on('format-window-title', function(tab)
  return get_current_working_dir(tab)
end)

return config
