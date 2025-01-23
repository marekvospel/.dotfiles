local M = {}

local lspconfig = require('lspconfig')

M.setup = function()
  lspconfig.lua_ls.setup({
    filetypes = { 'lua' },

    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  })
end

return M
