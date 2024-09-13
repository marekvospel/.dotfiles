return {

  -- LSP Configs, Completions, Formatting
  {
    'williamboman/mason.nvim',
    opts = function()
      return require('config.mason_config').opts
    end,
    config = function(_, opts)
      require('mason').setup(opts)

      require('config.mason_config').ensure_installed(opts.ensure_installed)
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lspconfig')
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-document-symbol',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
      },
    },
    opts = {
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' },
        { name = 'nvim_lua' },
        { name = 'path' },
      },
    },
  },
  {
    'stevearc/conform.nvim',
    opts = function()
      return require('config.conform')
    end,
  },

  -- Theme + UI
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
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

  -- Tmux integration
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    keys = {
      ['<C-h>'] = { '<cmd> TmuxNavigateLeft<CR>', 'window left' },
      ['<C-l>'] = { '<cmd> TmuxNavigateRight<CR>', 'window right' },
      ['<C-j>'] = { '<cmd> TmuxNavigateDown<CR>', 'window down' },
      ['<C-k>'] = { '<cmd> TmuxNavigateUp<CR>', 'window up' },
    },
  },

  -- Git integration
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    opts = {
      signcolumn = true,
      numhl = true,
      current_line_blame = true,
    },
  },

  -- Syntax highlight
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = function()
      return require('config.treesitter')
    end,
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  -- Better code readability
  'HiPhish/rainbow-delimiters.nvim',
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('config.indent-blankline')
    end,
  },

  -- Bracket pair
  {
    'm4xshen/autoclose.nvim',
    opts = {},
  },
}
