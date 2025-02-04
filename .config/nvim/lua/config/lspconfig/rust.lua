local M = {}

local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

M.setup = function(on_attach, capabilities)
  lspconfig.rust_analyzer.setup({
    filetypes = { 'rust' },
    rootdir = util.root_pattern('Cargo.toml'),
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
