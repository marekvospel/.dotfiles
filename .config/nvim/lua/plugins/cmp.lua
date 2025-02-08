return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
      },
    },
    opts = function()
      local cmp = require('cmp')

      local options = {
        completion = { completeopt = 'menu,menuone' },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Enter>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),

          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
        },
        sources = {
          { name = 'nvim_lsp', trigger_characters = { '-' } },
          { name = 'buffer' },
          { name = 'nvim_lua' },
          { name = 'path' },
        },
      }

      return options
    end,
  },
}
