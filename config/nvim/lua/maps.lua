local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Save file
keymap.set('n', '<C-s>', ':w<Return>')

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Move lines
keymap.set('n', '<C-j>', ':m .+1<CR>==')
keymap.set('n', '<C-k>', ':m .-2<CR>==')

keymap.set('n', '<leader>x', ':bdelete<Return>')
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = "Exit terminal mode" })
keymap.set('n', '<C-`>', ':botright vsplit | terminal<Return>', { desc = "Open terminal in split right" })
