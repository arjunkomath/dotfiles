local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Dark Pastel'

-- config.window_decorations = 'INTEGRATED_BUTTONS'
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true

config.font =
    wezterm.font('FiraCode Nerd Font Mono', { weight = 'Regular' })
config.font_size = 18.0

return config
