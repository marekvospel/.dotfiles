local M = {}

local dap = require('dap')

M.setup = function()
  -- Breakpoint hl
  vim.fn.sign_define('DapBreakpoint', { text = 'B', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
  vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#ff5050' })

  vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
  vim.keymap.set('n', '<leader>dc', dap.continue, {})
  vim.keymap.set('n', '<leader>dt', dap.terminate, {})
  vim.keymap.set('n', '<leader>ds', dap.session, {})
  vim.keymap.set('n', '<leader>dC', dap.run_to_cursor, {})
  vim.keymap.set('n', '<leader>di', dap.step_into, {})
  vim.keymap.set('n', '<leader>do', dap.step_out, {})
  vim.keymap.set('n', '<leader>dO', dap.step_over, {})

  vim.keymap.set('n', '<leader>dj', dap.down, {})
  vim.keymap.set('n', '<leader>dk', dap.up, {})

  vim.keymap.set('n', '<leader>dr', dap.repl.toggle, {})
  vim.keymap.set('n', '<leader>dw', function()
    require('dap.ui.widgets').hover()
  end, {})
  -- Maybe dg (goto), dP (pause), dl (run last)

  -- Adapters, configs
  require('config.debug.c').setup()
  require('config.debug.node').setup()

  local vscode = require('dap.ext.vscode')
  local json = require('plenary.json')
  vscode.json_decode = function(str)
    return vim.json.decode(json.json_strip_comments(str))
  end
end

return M
