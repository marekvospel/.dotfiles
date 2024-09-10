return {

  -- LSP Configs
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
	      "clangd",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "config.lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      }
    },
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_document_symbol" },
        { name = "nvim_lsp_signature_help" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      }
    }
  },

  -- Syntax highlight
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
  },

  -- Theme + UI
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim tree" },
    },
    opts = {
      filters = { dotfiles = false },
      renderer = {
        highlight_git = true,
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            git = { unmerged = "" },
          }
        }
      }
    },
  },

  -- Tmux integration
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    keys = {
        ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
        ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
        ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
        ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    }
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = {
      signcolumn = true,
      numhl = true,
      current_line_blame = true,
    },
  },
}
