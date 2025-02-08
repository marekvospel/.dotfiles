return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'rust',
        'toml',
        'c',
        'cpp',
        'printf',
        'make',
        'cmake',
        'latex',
        'typescript',
        'javascript',
        'vue',
        'svelte',
        'jsdoc',
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
