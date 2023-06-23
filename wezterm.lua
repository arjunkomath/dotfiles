local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


config.color_scheme = 'rose-pine'
config.window_decorations = 'RESIZE'

config.font = wezterm.font_with_fallback({
  "Fira Code",
  "JetBrains Mono",
  "monospace",
})
config.font_size = 15.0

return config
