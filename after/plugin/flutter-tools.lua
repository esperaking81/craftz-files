local status, flutter = pcall(require, "flutter-tools")
if (not status) then return end

flutter.setup {
  on_attach = require('craftzdog.handlers').on_attach,
  capabilities = require('craftzdog.handlers').capabilities,
}
