return {
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    keys = {
      { '<leader>gh', '<cmd>Gitsigns preview_hunk_inline<cr>', desc = 'Show git hunk info' },
      -- { '<leader>gb', '<cmd>Gitsigns blame<cr>', desc = 'Show git blame' },
      { '<leader>grr', '<cmd>Gitsigns reset_hunk<cr>', desc = 'Reset git hunk' },
    },
    opts = {
      signcolumn = true,
      numhl = false,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text_priority = 10000,
      },
    },
  },
}
