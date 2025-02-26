local lspconfig = require('lspconfig')

local M = {}

M.setup = function(on_attach, capabilities)
  -- Only needed for completions. (possibly move to init if I add snippets)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  lspconfig.jsonls.setup({
    settings = {
      json = {
        schemas = {
          {
            fileMatch = { 'package.json' },
            url = 'https://json.schemastore.org/package.json',
          },
          {
            fileMatch = { 'tsconfig.json', 'tsconfig.*.json' },
            url = 'https://json.schemastore.org/tsconfig',
          },
          {
            fileMatch = { 'jsconfig.json', 'jsconfig.*.json' },
            url = 'https://json.schemastore.org/jsconfig',
          },
          {
            fileMatch = { 'typedoc.json' },
            url = 'https://typedoc.org/schema.json',
          },
        },
        validate = {
          enable = true,
        },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
