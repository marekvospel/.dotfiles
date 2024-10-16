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
    lazy = false,
    config = function()
      require('config.lspconfig')
    end,
    keys = {
      { '<leader>r', vim.lsp.buf.rename, desc = 'lsp rename variable' },
    },
  },
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
    opts = {
      sources = {
        { name = 'nvim_lsp' },
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
    'nvim-tree/nvim-web-devicons',
    opts = {},
  },
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
      },
    },
    keys = {
      { '<Tab>',           '<cmd>BufferNext<cr>',         desc = 'Cycle to next barbar buffer' },
      { '<S-Tab>',         '<cmd>BufferPrevious<cr>',     desc = 'Cycle to previous barbar buffer' },
      { '<leader><Tab>',   '<cmd>BufferMoveNext<cr>',     desc = 'Move barbar buffer right' },
      { '<leader><S-Tab>', '<cmd>BufferMovePrevious<cr>', desc = 'Move barbar buffer left' },
      { '<leader>x',       '<cmd>BufferClose<cr>',        desc = 'Close current barbar buffer' },
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<C-n>', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle nvim tree' },
    },
    opts = function()
      return require('config.nvim-tree')
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader><leader>', '<cmd>Telescope find_files<cr>', desc = 'Fuzzy find files' },
    },
    config = function()
      require('config.telescope')
    end,
  },
  {
    'rachartier/tiny-code-action.nvim',
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    keys = {
      { '<leader>a', (function() require("tiny-code-action").code_action() end), desc = 'lsp code action' }
    },
    config = function()
      require('tiny-code-action').setup()
    end,
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
      numhl = false,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text_priority = 10000,
      },
    },
  },

  -- Wakatime
  {
    'wakatime/vim-wakatime',
    lazy = false,
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

  -- Debugging
  {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
      require('config.dap')
    end,
  },
}
