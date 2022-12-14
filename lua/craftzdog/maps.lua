local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Quickly exit insert mode
keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'jj', '<ESC>')

-- Escape to set no highlight
keymap.set('n', '<ESC>', '<CMD>noh<CR>')
keymap.set('n', '<Leader>h', '<CMD>noh<CR>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})
keymap.set('n', '<C-s>', '<CMD>w<CR>')
keymap.set('n', '<leader>x', '<CMD>wq<CR>')

-- flutter
keymap.set('n', '<C-f>', '<CMD>Telescope flutter commands<CR>')

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

-- lsp stuffs
keymap.set('n', '<leader>f', '<CMD>lua vim.lsp.buf.formatting {}<CR>')
