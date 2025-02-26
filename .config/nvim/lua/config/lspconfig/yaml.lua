local lspconfig = require('lspconfig')

local M = {}

M.setup = function(on_attach, capabilities)
  lspconfig.yamlls.setup({
    settings = {
      yaml = {
        schemas = {
          ['https://json.schemastore.org/github-workflow.json'] = { '/.github/workflows/*.y(a)ml' },
          ['https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json'] = {
            '.gitlab-ci.y(a)ml',
          },
        },
        format = {
          enable = true,
        },
      },
      redhat = {
        telemetry = {
          enabled = false,
        },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
