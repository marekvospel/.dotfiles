return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        integrations = {
          native_lsp = {
            inlay_hints = {
              background = false,
            },
          },
        },
      })
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    opts = {},
  },
}
