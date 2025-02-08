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
        format_on_save = {
          timeout_ms = 1000,
        },
      }
    end,
  },
}
