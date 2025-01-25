local M = {}

M.setup = function()
  require('config.lspconfig.rust').setup()
  require('config.lspconfig.c').setup()
  require('config.lspconfig.node').setup()
  require('config.lspconfig.lua').setup()
end

return M
