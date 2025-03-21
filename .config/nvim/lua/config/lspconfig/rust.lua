local M = {}

M.setup = function(on_attach, capabilities)
  vim.g.rustaceanvim = {
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
      default_settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            styleLints = {
              enable = true,
            },
          },
          check = {
            command = 'clippy',
          },
        },
      },
    },
  }
end

return M
