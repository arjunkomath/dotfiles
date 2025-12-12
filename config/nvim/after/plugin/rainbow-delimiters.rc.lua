local status, rainbow = pcall(require, "rainbow-delimiters")
if (not status) then return end

vim.g.rainbow_delimiters = {
  strategy = {
    [''] = rainbow.strategy['local'],
  },
}
