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
        custom_highlights = function(colors)
          return {
            CmpPmenu = { bg = colors.base },
            CmpSel = { bg = colors.surface1 },
            CmpBorder = { fg = colors.surface2, bg = colors.base },
            CmpItemKindTailwindcss = { fg = '#00bcff' },
            CmpItemKindUnocss = {},
          }
        end,
      })
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    opts = {},
  },
}
