local M = {}

local dap = require('dap')

M.setup = function()
  dap.adapters.gdb = {
    type = 'executable',
    command = 'gdb',
    args = { '-i', 'dap' },
  }
  dap.adapters.lldb = {
    type = 'executable',
    command = 'codelldb',
  }
  dap.adapters.codelldb = {
    type = 'executable',
    command = 'codelldb',
  }
end

return M
