local M = {}

local dap = require('dap')
local mason_registry = require('mason-registry')
local js_dap_path = mason_registry.get_package('js-debug-adapter'):get_install_path() .. '/js-debug-adapter'
local firefox_dap_path = mason_registry.get_package('firefox-debug-adapter'):get_install_path()
  .. '/firefox-debug-adapter'

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
  dap.adapters.firefox = {
    type = 'executable',
    command = firefox_dap_path,
  }
end

return M
