local status = pcall(require, 'Comment')
if not status then return end

local comment_api = require('Comment.api')

vim.keymap.set('n', '<leader>/', function ()
  comment_api.toggle.linewise.current()
end, { silent = true })

vim.keymap.set('v', '<leader>/', function ()
  comment_api.toggle.linewise(vim.fn.visualmode())
end)
