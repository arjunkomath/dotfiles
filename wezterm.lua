local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Nucolors (terminal.sexy)'

-- config.window_decorations = 'INTEGRATED_BUTTONS'
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font({
  family = "MonoLisa",
  weight = "Book",
  harfbuzz_features = { "liga=1" },
});

config.font_size = 18.0
config.cell_width = 0.9
config.window_background_opacity = 0.98
config.macos_window_background_blur = 30

config.keys = {
  {
    key = '"',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '%',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- activate pane selection mode with the default alphabet (labels are "a", "s", "d", "f" and so on)
  { key = '0', mods = 'CTRL', action = act.PaneSelect },
}

return config
