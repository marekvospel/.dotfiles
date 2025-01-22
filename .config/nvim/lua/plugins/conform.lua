return {
  {
    'stevearc/conform.nvim',
    opts = function()
      return {
        formatters_by_ft = {
          lua = { 'stylua', lsp_format = 'fallback' },
          rust = { 'rustfmt', lsp_format = 'fallback' },
          c = { 'clang-format', lsp_format = 'fallback' },
          cpp = { 'clang-format', lsp_format = 'fallback' },
          nix = { 'nixfmt', lsp_format = 'fallback' },
        },
        format_on_save = function(bufid)
          if vim.g.disable_autoformat or vim.b[bufid].disable_autoformat then
            return
          end

          return {
            timeout_ms = 1000,
          }
        end,
      }
    end,
    config = function(_, opts)
      require('conform').setup(opts)

      -- MIT https://github.com/AAA1exa8/nvim-dotfiles/blob/master/lua/custom/plugins/conform.lua
      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
      })
      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = 'Re-enable autoformat-on-save',
      })
    end,
  },
}
