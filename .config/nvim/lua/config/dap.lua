local dap, dapui = require('dap'), require('dapui')
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- Breakpoints
vim.fn.sign_define('DapBreakpoint', { text = 'B', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#ff5050' })

vim.keymap.set('n', 'dB', dap.toggle_breakpoint, {})
vim.keymap.set('n', 'dt', dapui.toggle, {})

dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  args = { '-i', 'dap' },
}

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
