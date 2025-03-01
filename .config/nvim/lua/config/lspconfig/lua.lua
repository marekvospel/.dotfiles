local M = {}

local lspconfig = require('lspconfig')

M.setup = function(on_attach, capabilities)
  lspconfig.lua_ls.setup({
    filetypes = { 'lua' },

    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
        telemetry = { enable = false },
        hint = { enable = true },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
