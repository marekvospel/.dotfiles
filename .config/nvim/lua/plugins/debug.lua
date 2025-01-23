return {
  {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      {
        'theHamsta/nvim-dap-virtual-text',
        opts = {},
      },
    },
    config = function()
      require('config.debug').setup()
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      dapui.setup()

      -- Auto open DAP UI
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close({})
      end

      vim.keymap.set('n', '<leader>du', dapui.toggle, {})
      vim.keymap.set('n', '<leader>de', dapui.eval, {})
    end,
  },
}
