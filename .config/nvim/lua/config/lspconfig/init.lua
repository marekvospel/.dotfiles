local M = {}

M.on_attach = function(client, bufnr)
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Go to declaration' })
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to definition' })
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Go to implementation' })
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = bufnr, desc = 'lsp rename variable' })

  -- Setup inlay hints
  if client.supports_method('textDocument/inlayHint') and (vim.api.nvim_buf_get_option(bufnr, 'filetype') ~= 'vue') then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end
local capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities = capabilities

M.setup = function()
  require('config.lspconfig.rust').setup(M.on_attach, M.capabilities)
  require('config.lspconfig.c').setup(M.on_attach, M.capabilities)
  require('config.lspconfig.node').setup(M.on_attach, M.capabilities)
  require('config.lspconfig.lua').setup(M.on_attach, M.capabilities)
  require('config.lspconfig.json').setup(M.on_attach, M.capabilities)
  require('config.lspconfig.yaml').setup(M.on_attach, M.capabilities)
  require('config.lspconfig.toml').setup(M.on_attach, M.capabilities)
end

return M
