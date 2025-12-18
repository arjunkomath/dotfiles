if vim.g.neovide then
  vim.o.guifont = "Berkeley Mono:h17:w-1"

  vim.g.neovide_opacity = 0.9
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_corner_radius = 0.5

  vim.g.neovide_scroll_animation_length = 0.2

  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_smooth_blink = true

  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_input_macos_option_key_is_meta = 'only_left'

  vim.g.neovide_scale_factor = 1.0

  vim.keymap.set("n", "<C-=>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.1
  end)

  vim.keymap.set("n", "<C-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.1
  end)

  vim.keymap.set("n", "<C-0>", function()
    vim.g.neovide_scale_factor = 1.0
  end)
end
