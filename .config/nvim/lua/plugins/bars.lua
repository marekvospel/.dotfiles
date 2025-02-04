return {
  {
    'romgrk/barbar.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'lewis6991/gitsigns.nvim',
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      sidebar_filetypes = {
        NvimTree = true,
        ['dapui_watches'] = { event = 'BufWinLeave' },
        -- Possibly dapui_stacks, bapui_breakpoints, dapui_scopes, dapui_console, dap-repl
      },
    },
    keys = {
      { '<Tab>', '<cmd>BufferNext<cr>', desc = 'Cycle to next barbar buffer' },
      { '<S-Tab>', '<cmd>BufferPrevious<cr>', desc = 'Cycle to previous barbar buffer' },
      { '<leader><Tab>', '<cmd>BufferMoveNext<cr>', desc = 'Move barbar buffer right' },
      { '<leader><S-Tab>', '<cmd>BufferMovePrevious<cr>', desc = 'Move barbar buffer left' },
      { '<leader>x', '<cmd>BufferClose<cr>', desc = 'Close current barbar buffer' },
      { '<leader><S-x>', '<cmd>BufferClose!<cr>', desc = 'Force close current barbar buffer' },
    },
  },
}
