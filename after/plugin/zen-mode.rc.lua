local status, zenMode = pcall(require, "true-zen")
if (not status) then return end

zenMode.setup {
}

vim.keymap.set('n', '<leader>za', '<cmd>TZAtaraxis<cr>', { silent = true })
