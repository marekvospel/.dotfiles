local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path()
    .. '/node_modules/@vue/language-server'

local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

lspconfig.ts_ls.setup({
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },

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
  },
})
lspconfig.unocss.setup({
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'vue-html', 'html', 'css' },
  root_dir = function(fname)
    return utils.root_pattern('unocss.config.js', 'unocss.config.ts')(fname)
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
  rootdir = util.root_pattern("Cargo.toml"),
})
