local M = {}

local dap = require('dap')

M.setup = function()
  dap.adapters.gdb = {
    type = 'executable',
    command = 'gdb',
    args = { '-i', 'dap' },
  }
  -- TODO: add vscode dap configurations

  -- C / C++ / Rust
  local latest_c_prog = 'a.out'
  local c_config = {
    {
      name = 'Launch C',
      type = 'gdb',
      request = 'launch',
      program = function()
        local cwd = vim.fn.getcwd() .. '/'

        local file = vim.fn.input('Path to executable (' .. latest_c_prog .. '):', cwd, 'file')

        if file == cwd then
          return cwd .. latest_c_prog
        else
          latest_c_prog = file:gsub('^' .. cwd, '')
          return file
        end
      end,
    },
  }

  dap.configurations.c = c_config
  dap.configurations.cpp = c_config
  dap.configurations.rust = c_config
end

return M
