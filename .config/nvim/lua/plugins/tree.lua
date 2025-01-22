return {
  {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<C-n>', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle nvim tree' },
    },
    opts = {
      filters = { dotfiles = false },
      renderer = {
        highlight_git = true,
        indent_markers = { enable = true },
        icons = {
          git_placement = 'after',
          modified_placement = 'after',
          glyphs = {
            git = {
              unmerged = '',
              untracked = '',
              renamed = '',
              unstaged = '*',
              staged = '',
              deleted = '',
              ignored = '',
            },
          },
        },
      },
    },
  },
}
