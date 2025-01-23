return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
      require('config.lspconfig').setup()
    end,
    keys = {
      { '<leader>r', vim.lsp.buf.rename, desc = 'lsp rename variable' },
    },
  },
  {
    'rachartier/tiny-code-action.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' },
    },
    keys = {
      {
        '<leader>a',
        function()
          require('tiny-code-action').code_action()
        end,
        desc = 'lsp code action',
      },
    },
    config = function()
      require('tiny-code-action').setup()
    end,
  },
}
