local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

local colors = require("tokyonight.colors").setup()

bufferline.setup({
  options = {
    mode = "tabs",
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    separator_style = "thin",
  },
  highlights = {
    fill = { bg = colors.bg_dark },
    background = { bg = colors.bg_dark },
    buffer_selected = { bg = colors.bg, bold = true },
    separator = { fg = colors.bg_dark, bg = colors.bg_dark },
    separator_selected = { fg = colors.bg_dark },
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
