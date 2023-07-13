local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

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

-- move lines
keymap.set('n', '<A-j>', ':m .+1<CR>==')
keymap.set('n', '<A-k>', ':m .-2<CR>==')

-- keymap.set('n', '<C-j>', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- keymap.set('n', '<C-k>', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
-- keymap.set('n', 'ga', '<Cmd>Lspsaga show_buf_diagnostics<CR>', opts)
-- keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', opts)
-- keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
-- keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
-- keymap.set({ "n", "v" }, "gca", "<cmd>Lspsaga code_action<CR>")
