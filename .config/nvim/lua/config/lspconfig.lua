local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path()
  .. '/node_modules/@vue/language-server'
local typescript_language_server_path = mason_registry.get_package('typescript-language-server'):get_install_path()
  .. '/node_modules/typescript/lib'

local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

local function has_files(bufid, ...)
  local patterns = { ... }
  local finder = util.root_pattern(unpack(patterns))

  local bufname = vim.api.nvim_buf_get_name(bufid)
  local bufdir = vim.fn.fnamemodify(bufname, ':p:h')

  return finder(bufdir) ~= nil
end

lspconfig.ts_ls.setup({
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' },

  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },

    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  },
})
lspconfig.volar.setup({
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },

  init_options = {
    vue = {
      hybridMode = false,
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
})
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
  root_dir = function(fname)
    return util.root_pattern('unocss.config.js', 'unocss.config.ts', 'uno.config.ts', 'uno.config.js')(fname)
  end,
})
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
})
lspconfig.eslint.setup({
  filetypes = { 'typescript', 'javascript', 'vue' },
  on_attach = function(client, bufid)
    -- Not optimal, as it has some delay, but it works I guess
    if not has_files(bufid, '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.mjs', '.eslintrc.json') then
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
  end,
})

lspconfig.clangd.setup({
  filetypes = { 'c', 'cpp' },
})
lspconfig.lua_ls.setup({
  filetypes = { 'lua' },

  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})
lspconfig.rust_analyzer.setup({
  filetypes = { 'rust' },
  rootdir = util.root_pattern('Cargo.toml'),
})
