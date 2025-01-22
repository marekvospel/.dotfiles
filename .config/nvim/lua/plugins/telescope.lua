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

      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

      table.insert(vimgrep_arguments, '--hidden')
      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!**/.git/*')

      telescope.setup({
        defaults = {
          vimgrep_arguments = vimgrep_arguments,
        },
        pickers = {
          find_files = {
            find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
          },
        },
      })
    end,
  },
}
