local status, flutter = pcall(require, "flutter-tools")
if (not status) then return end

flutter.setup {
    ui = {
        border = "rounded",
    },
    on_attach = function(_, bufnr)
      require('craftzdog.handlers').on_attach(_, bufnr)
      require('craftzdog.handlers').enable_format_on_save(_, bufnr)

      vim.keymap.set('n', '<C-f>', ':Telescope flutter commands<CR>')
    end,
    capabilities = require('craftzdog.handlers').capabilities,
    dev_log = {
        enabled = true,
        open_cmd = "tabedit", -- command to use to open the log buffer
    },
}
