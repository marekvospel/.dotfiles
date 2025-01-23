local M = {}

M.setup = function()
  require('config.lspconfig.rust').setup()
  require('config.lspconfig.c').setup()
  require('config.lspconfig.node').setup()
  require('config.lspconfig.lua').setup()
end

M.has_files = function(bufid, ...)
  local util = require('lspconfig/util')
  local patterns = { ... }
  ---@diagnostic disable-next-line: deprecated
  local finder = util.root_pattern(unpack(patterns))

  local bufname = vim.api.nvim_buf_get_name(bufid)
  local bufdir = vim.fn.fnamemodify(bufname, ':p:h')

  return finder(bufdir) ~= nil
end

return M
