local M = {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = {
    routes = {
      {
        filter = { event = 'notify', find = 'No information available' },
        opts = { skip = true },
      },
    },
    presets = {
      command_palette = true,
    },
    cmdline = {
      view = 'cmdline_popup',
      opts = {
        position = {
          row = '75%',
          col = '50%',
        },
      },
    },
  },
}

return M
