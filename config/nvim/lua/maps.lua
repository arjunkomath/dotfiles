local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Save file
keymap.set('n', '<C-s>', ':w<Return>')


-- Move lines
keymap.set('n', '<C-j>', ':m .+1<CR>==')
keymap.set('n', '<C-k>', ':m .-2<CR>==')

keymap.set('n', '<leader>x', ':bdelete<Return>')
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = "Exit terminal mode" })
keymap.set('n', '<C-`>', ':botright vsplit | terminal<Return>', { desc = "Open terminal in split right" })
