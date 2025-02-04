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
      require "plugins.configs.lspconfig"
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end
  },
  -- Syntax highlight
  "nvim-treesitter/nvim-treesitter",
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
  -- Tree
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim tree" },
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
}
