local M = {}

local dap = require('dap')

M.setup = function()
  dap.adapters.gdb = {
    type = 'executable',
    command = 'gdb',
    args = { '-i', 'dap' },
  }
end

return M
