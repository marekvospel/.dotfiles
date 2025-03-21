return {
  'nvim-neotest/neotest',
  lazy = false,
  keys = {
    {
      '<leader>tr',
      function()
        require('neotest').run.run()
      end,
      desc = 'Neotest: test closest test',
    },
    {
      '<leader>td',
      function()
        require('neotest').run.run({ strategy = 'dap' })
      end,
      desc = 'Neotest: test closest test',
    },
    {
      '<leader>to',
      function()
        require('neotest').output.open()
      end,
      desc = 'Neotest: Show nearest test output',
    },
    {
      '<leader>tf',
      function()
        require('neotest').run.run(vim.fn.expand('%'))
      end,
      desc = 'Neotest: test file',
    },
    {
      '<leader>tt',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Neotest: toggle test summary',
    },
  },
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',

    -- Configured in config/lspconfig/rust.lua
    'mrcjkb/rustaceanvim',
    'marilari88/neotest-vitest',
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('rustaceanvim.neotest'),
        require('neotest-vitest')({
          filter_dir = function(name, rel_path, root)
            return name ~= 'node_modules' and name ~= 'e2e'
          end,
        }),
      },
      optput = {
        auto_close = true,
      },
    })
  end,
}
