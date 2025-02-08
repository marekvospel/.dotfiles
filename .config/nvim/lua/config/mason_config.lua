local M = {
  opts = {}
}

local non_nix_installed = {
  'clangd',
  'clang-format',
  'stylua',
  'lua-language-server',
}

local ensure_installed = {
  -- Nix has to be installed manually :(
  'typescript-language-server',
  'vue-language-server',
  'unocss-language-server',
}

if os.getenv("NVIM_MASON_NIX") ~= "true" then
  M.opts.ensure_installed = { unpack(ensure_installed), unpack(non_nix_installed) }
else
  M.opts.ensure_installed = ensure_installed
end

M.ensure_installed = function(packages)
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

return M
