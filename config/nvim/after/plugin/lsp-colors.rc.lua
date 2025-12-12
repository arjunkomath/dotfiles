local status, lsp_colors = pcall(require, "lsp-colors")
if (not status) then return end

local colors = require("tokyonight.colors").setup()

lsp_colors.setup {
  Error = colors.error,
  Warning = colors.warning,
  Information = colors.info,
  Hint = colors.hint
}
