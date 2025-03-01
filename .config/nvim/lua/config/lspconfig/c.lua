local lspconfig = require('lspconfig')

local M = {}

M.setup = function(on_attach, capabilities)
  lspconfig.clangd.setup({
    filetypes = { 'c', 'cpp' },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
