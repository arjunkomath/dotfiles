local status, colorizer = pcall(require, "colorizer")
if (not status) then return end

colorizer.setup({
  filetypes = { "*" },
  user_default_options = {
    RGB = true,
    RRGGBB = true,
    names = false,
    RRGGBBAA = true,
    css = true,
    css_fn = true,
    mode = "background",
    tailwind = true,
    virtualtext = "■",
  },
})
