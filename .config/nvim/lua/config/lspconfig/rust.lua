local M = {}

local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

M.setup = function()
  lspconfig.rust_analyzer.setup({
    filetypes = { 'rust' },
    rootdir = util.root_pattern('Cargo.toml'),
  })
end

return M
