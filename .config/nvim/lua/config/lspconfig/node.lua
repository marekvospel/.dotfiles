local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path()
  .. '/node_modules/@vue/language-server'
local typescript_language_server_path = mason_registry.get_package('typescript-language-server'):get_install_path()
  .. '/node_modules/typescript/lib'

local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local buf_root_pattern = require('util.files').buf_root_pattern

local M = {}

M.setup = function(on_attach, capabilities)
  local inlayHints = {
    includeInlayParameterNameHints = 'all',
    includeInlayParameterNameHintsWhenArgumentMatchesName = false,

    includeInlayVariableTypeHints = true,
    includeInlayFunctionParameterTypeHints = true,
    includeInlayVariableTypeHintsWhenTypeMatchesName = false,

    includeInlayPropertyDeclarationTypeHints = true,
    includeInlayFunctionLikeReturnTypeHints = true,
    includeInlayEnumMemberValueHints = true,
  }

  -- Js / Typescript
  lspconfig.ts_ls.setup({
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' },

    init_options = {
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = vue_language_server_path,
          languages = { 'vue', 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
        },
      },
    },
    settings = {
      javascript = {
        inlayHints = inlayHints,
      },
      typescript = {
        inlayHints = inlayHints,
      },
      javascriptreact = {
        inlayHints = inlayHints,
      },
      typescriptreact = {
        inlayHints = inlayHints,
      },
      vue = {
        inlayHints = inlayHints,
      },
      svelte = {
        inlayHints = inlayHints,
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- Vue
  lspconfig.volar.setup({
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },

    init_options = {
      vue = {
        hybridMode = true,
      },
      typescript = {
        tsdk = typescript_language_server_path,
      },
    },

    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = 'ignore',
        },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- Svelte
  lspconfig.svelte.setup({
    filetypes = { 'svelte' },

    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = 'ignore',
        },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- UnoCSS, CSS
  lspconfig.unocss.setup({
    filetypes = {
      'typescript',
      'javascript',
      'javascriptreact',
      'typescriptreact',
      'vue',
      'vue-html',
      'svelte',
      'svelte-html',
      'html',
      'css',
    },
    root_dir = util.root_pattern('unocss.config.js', 'unocss.config.ts', 'uno.config.ts', 'uno.config.js'),
    on_attach = on_attach,
    capabilities = capabilities,
  })
  lspconfig.cssls.setup({
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = 'ignore',
        },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- Eslint lsp
  lspconfig.eslint.setup({
    filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue', 'svelte' },
    on_attach = function(client, bufid)
      -- Not optimal, as it has some delay, but it works I guess
      if not buf_root_pattern(bufid, '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.mjs', '.eslintrc.json') then
        client.stop()
      else
        vim.api.nvim_create_autocmd('BufWritePre', {
          callback = function(args)
            if args.buf == bufid and not vim.g.disable_autoformat and not vim.b[bufid].disable_autoformat then
              vim.cmd('EslintFixAll')
            end
          end,
        })
      end
      on_attach(client, bufid)
    end,
    capabilities = capabilities,
  })

  -- Biome
  lspconfig.biome.setup({
    filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue', 'svelte' },

    on_attach = function(client, bufid)
      -- Not optimal, as it has some delay, but it works I guess
      if not buf_root_pattern(bufid, 'biome.json', 'biome.jsonc') then
        client.stop()
      end
      on_attach(client, bufid)
    end,
    capabilities = capabilities,
  })
  -- oxlint
  lspconfig.oxlint.setup({
    filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue', 'svelte' },

    on_attach = function(client, bufid)
      -- Not optimal, as it has some delay, but it works I guess
      if not buf_root_pattern(bufid, '.oxlintrc.json') then
        client.stop()
      end

      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function(args)
          if args.buf == bufid and not vim.g.disable_autoformat and not vim.b[bufid].disable_autoformat then
            vim.cmd('OxcFixAll')
          end
        end,
      })

      on_attach(client, bufid)
    end,
    capabilities = capabilities,
  })
end

return M
