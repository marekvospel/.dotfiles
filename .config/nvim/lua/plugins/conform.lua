local buf_root_pattern = require('util.files').buf_root_pattern

local js_formatter = function(bufid)
  local formatters = {}

  if
    buf_root_pattern(
      bufid,
      '.prettierrc.toml',
      '.prettierrc.js',
      '.prettierrc.mjs',
      '.prettierrc.cjs',
      '.prettier.config.js',
      '.prettier.config.mjs',
      '.prettier.config.cjs'
    )
  then
    table.insert(formatters, 'prettier')
  end

  -- exlint eventually?

  if buf_root_pattern(bufid, 'biome.json', 'biome.jsonc') then
    table.insert(formatters, 'biome')
  end

  -- oxc formatter eventually?

  return formatters
end

return {
  {
    'stevearc/conform.nvim',
    opts = function()
      local formatters = {
        [{ 'lua' }] = { 'stylua' },
        [{ 'rust' }] = { 'rustfmt' },
        [{ 'c' }] = { 'clang-format' },
        [{ 'cpp' }] = { 'clang-format' },
        [{ 'nix' }] = { 'nixfmt' },
        [{ 'toml' }] = { 'taplo' },
        [{ 'yaml', 'json', 'jsonc' }] = { lsp_format = 'prefer' },
        [{ 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' }] = js_formatter,
      }

      local mapped_formatters = {}

      for langs, format in pairs(formatters) do
        for _, lang in ipairs(langs) do
          mapped_formatters[lang] = format
        end
      end

      return {
        formatters_by_ft = mapped_formatters,
        format_on_save = function(bufid)
          if vim.g.disable_autoformat or vim.b[bufid].disable_autoformat then
            return
          end

          return {
            timeout_ms = 1000,
          }
        end,
        lsp_format = { 'never' },
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
