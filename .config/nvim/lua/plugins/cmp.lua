-- https://github.com/NvChad/ui/blob/v3.0/lua/nvchad/icons/lspkind.lua
-- GPLv3
local icons = {
  Namespace = '󰌗',
  Text = '󰉿',
  Method = '󰆧',
  Function = '󰆧',
  Constructor = '',
  Field = '󰜢',
  Variable = '󰀫',
  Class = '󰠱',
  Interface = '',
  Module = '',
  Property = '󰜢',
  Unit = '󰑭',
  Value = '󰎠',
  Enum = '',
  Keyword = '󰌋',
  Snippet = '',
  Color = '󰏘',
  File = '󰈚',
  Reference = '󰈇',
  Folder = '󰉋',
  EnumMember = '',
  Constant = '󰏿',
  Struct = '󰙅',
  Event = '',
  Operator = '󰆕',
  TypeParameter = '󰊄',
  Table = '',
  Object = '󰅩',
  Tag = '',
  Array = '[]',
  Boolean = '',
  Number = '',
  Null = '󰟢',
  Supermaven = '',
  String = '󰉿',
  Calendar = '',
  Watch = '󰥔',
  Package = '',
  Copilot = '',
  Codeium = '',
  TabNine = '',
  BladeNav = '',
  Tailwind = '󱏿',
  Unocss = '󱏿',
}

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
        window = {
          completion = {
            scrollbar = false,
            side_padding = 1,
            winhighlight = 'Normal:CmpPmenu,CursorLine:CmpSel,Search:None,FloatBorder:CmpBorder',
            border = 'single',
          },
          documentation = {
            border = 'single',
            winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpBorder',
          },
        },
        formatting = {
          format = function(entry, item)
            if entry.source.name == 'nvim_lsp' and entry.source.source.client then
              if entry.source.source.client.name == 'unocss' then
                item.kind = 'Unocss'
                item.kind_hl_group = 'CmpItemKindUnocss'
              elseif entry.source.source.client.name == 'tailwindcss' then
                item.kind = 'Tailwind'
                item.kind_hl_group = 'CmpItemKindTailwindcss'
              end
            end

            item.kind = ' ' .. (icons[item.kind] or '') .. ' ' .. item.kind

            return item
          end,
          fields = { 'abbr', 'kind', 'menu' },
        },
      }

      return options
    end,
  },
}
