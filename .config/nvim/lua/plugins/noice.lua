local M = {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = {
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
