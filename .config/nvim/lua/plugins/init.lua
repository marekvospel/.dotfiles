return {
  -- LSP Configs
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },
  -- Syntax highlight
  "nvim-treesitter/nvim-treesitter",
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