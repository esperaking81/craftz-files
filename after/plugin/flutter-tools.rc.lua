local present, flutter_tools = pcall(require, 'flutter-tools')
if not present then
  return
end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap = true, silent = true }

  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end

  -- keymaps
  buf_set_keymap('n', '<leader>fc', '<Cmd>Telescope flutter commands<CR>', opts)
  buf_set_keymap('n', '<leader>fd', '<Cmd>FlutterDevices<CR>', opts)
  buf_set_keymap('n', '<leader>fe', '<Cmd>FlutterEmulators<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

flutter_tools.setup {
  ui = {
    border =  'rounded',
  },
  dev_log = {
    enabled = false,
    open_cmd = "flutterlogs", -- command to use to open the log buffer
  },

  dev_tools = {
    autostart = true, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },

  lsp = {
    color = {
      enabled = true,
    },

    on_attach = on_attach,
    capabilities = capabilities,

    settings = {
      showTodos = true,
      enableSnippets = true,
      completeFunctionCalls = true,
      renameFilesWithClasses = "prompt",
    }
  }
}
