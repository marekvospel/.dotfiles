local mason_opts = {
  ensure_installed = {},
  registries = {
    'file:/home/vospel/.dotfiles/.config/nvim/mason/',
    'github:mason-org/mason-registry',
  },
}

-- Packages that are installed on non-nix devices
local non_nix_installed = {
  'clangd',
  'clang-format',
  'stylua',
  'lua-language-server',
  'biome',
  'taplo',
}

local ensure_installed = {
  'typescript-language-server',
  'vue-language-server',
  'unocss-language-server',
  'firefox-debug-adapter',
  'js-debug-adapter',
  'prettier',
  'eslint-lsp',
  'json-lsp',
  'yaml-language-server',
}

if os.getenv('NVIM_MASON_NIX') ~= 'true' then
  ---@diagnostic disable-next-line: deprecated
  mason_opts.ensure_installed = { unpack(ensure_installed), unpack(non_nix_installed) }
else
  mason_opts.ensure_installed = ensure_installed
end

local install_ensure_installed = function(packages)
  if packages == nil then
    return
  end

  local mr = require('mason-registry')

  mr.refresh(function()
    local install_needed = {}

    for _, tool in ipairs(packages) do
      local p = mr.get_package(tool)

      if not p:is_installed() then
        table.insert(install_needed, tool)
      end
    end

    if not next(install_needed) then
      return
    end

    vim.cmd('Mason')

    for _, tool in ipairs(install_needed) do
      mr.get_package(tool):install()
    end
  end)
end

return {
  {
    'williamboman/mason.nvim',
    opts = function()
      return mason_opts
    end,
    config = function(_, opts)
      require('mason').setup(opts)

      install_ensure_installed(opts.ensure_installed)
    end,
  },
}
