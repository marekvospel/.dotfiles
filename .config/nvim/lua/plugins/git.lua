return {
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
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
