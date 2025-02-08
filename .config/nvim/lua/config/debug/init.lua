local M = {}

local dap = require('dap')

M.setup = function()
  -- Breakpoint hl
  vim.fn.sign_define('DapBreakpoint', { text = 'B', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
  vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#ff5050' })

  vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
  vim.keymap.set('n', '<leader>dc', dap.continue, {})
  vim.keymap.set('n', '<leader>dt', dap.terminate, {})

  vim.keymap.set('n', '<leader>dr', dap.repl.toggle, {})

  -- Adapters, configs
  require('config.debug.c').setup()
end

return M
