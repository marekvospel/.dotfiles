local lspconfig = require('lspconfig')

local M = {}

M.setup = function(on_attach, capabilities)
  lspconfig.taplo.setup({
    cmd_env = {
      TAPLO_CONFIG = vim.fn.expand('~/.config/nvim/taplo.toml'),
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
