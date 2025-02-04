return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
      require('config.lspconfig').setup()
    end,
  },
  {
    'rachartier/tiny-code-action.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' },
    },
    -- stylua: ignore
    keys = {
      { '<leader>a', function () require('tiny-code-action').code_action() end, desc = 'lsp code action' },
    },
    config = function()
      require('tiny-code-action').setup()
    end,
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        line = '<leader>cc',
        block = '<leader>bc',
      },
      opleader = {
        line = '<leader>c',
        block = '<leader>b',
      },
      extra = {
        above = '<leader>cO',
        below = '<leader>co',
        eol = '<leader>cA',
      },
    },
  },
  {
    'felpafel/inlay-hint.nvim',
    event = 'LspAttach',
    config = function()
      require('inlay-hint').setup({
        virt_text_pos = 'inline',
        highlight_group = 'LspInlayHint',
        hl_mode = 'replace',
      })
    end,
  },
}
