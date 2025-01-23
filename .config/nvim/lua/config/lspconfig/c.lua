local lspconfig = require('lspconfig')

local M = {}

M.setup = function()
  lspconfig.clangd.setup({
    filetypes = { 'c', 'cpp' },
  })
end

return M
