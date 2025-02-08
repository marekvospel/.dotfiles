local M = {}

local dap = require('dap')
local mason_registry = require('mason-registry')
local js_dap_path = mason_registry.get_package('js-debug-adapter'):get_install_path() .. '/js-debug-adapter'

M.setup = function()
  dap.adapters['pwa-node'] = {
    type = 'server',
    host = 'localhost',
    port = '${port}',
    executable = {
      command = js_dap_path,
      args = { '${port}' },
    },
  }
  -- TODO: Firefox / chrome launch adapter
end

return M
