local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Save file
keymap.set('n', '<C-s>', ':w<Return>')

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Move lines
keymap.set('n', '<A-j>', ':m .+1<CR>==')
keymap.set('n', '<A-k>', ':m .-2<CR>==')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Undo tree
keymap.set('n', '<C-z>', ':UndotreeToggle<Return>')

-- Trouble
keymap.set('n', 'tt', ':TroubleToggle<Return>')
keymap.set('n', 'tw', ':TroubleToggle workspace_diagnostics<Return>')
keymap.set('n', 'td', ':TroubleToggle document_diagnostics<Return>')

-- Quick fix
keymap.set('n', 'qf', ':copen<Return>')
keymap.set('n', 'qc', ':cclose<Return>')

-- Spectre aka Search and Replace
keymap.set('n', '<Space><Space>', ':Spectre<Return>')
keymap.set('n', '<C-f>', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>')
keymap.set('n', '<C-Return>', '<cmd>lua require("spectre.actions").run_replace()<CR>')

-- Oil
keymap.set('n', '<Space>f', ':Oil<Return>')

-- Neogit
keymap.set('n', '<C-g>', ':Neogit<Return>')
