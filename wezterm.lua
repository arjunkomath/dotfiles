local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#000000"
custom.tab_bar.background = "#040404"
custom.tab_bar.inactive_tab.bg_color = "#0f0f0f"
custom.tab_bar.new_tab.bg_color = "#080808"

config.color_schemes = {
  ["OLEDppuccin"] = custom,
}
config.color_scheme = "OLEDppuccin"

-- config.window_decorations = 'INTEGRATED_BUTTONS'
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true

config.font =
    wezterm.font('FiraCode Nerd Font Mono', { weight = 'Regular' })
config.font_size = 18.0
config.cell_width = 0.95

return config
