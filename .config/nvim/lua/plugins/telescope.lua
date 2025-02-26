return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader><leader>', '<cmd>Telescope find_files<cr>', desc = 'Fuzzy find files' },
      { '<leader>/', '<cmd>Telescope live_grep<cr>', desc = 'Fuzzy find files' },
    },
    config = function()
      local telescope = require('telescope')
      local telescopeConfig = require('telescope.config')

      ---@diagnostic disable-next-line: deprecated
      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

      local ignoreFile = '--ignore-file=' .. vim.fn.expand('~/.config/nvim/.rgignore')

      table.insert(vimgrep_arguments, '-uu')
      table.insert(vimgrep_arguments, ignoreFile)

      telescope.setup({
        defaults = {
          vimgrep_arguments = vimgrep_arguments,
        },
        pickers = {
          find_files = {
            find_command = {
              'rg',
              '--files',
              '-uu',
              ignoreFile,
            },
          },
        },
      })
    end,
  },
}
