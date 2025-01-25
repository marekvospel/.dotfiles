local M = {}

M.buf_root_pattern = function(bufid, ...)
  local util = require('lspconfig/util')
  local patterns = { ... }
  ---@diagnostic disable-next-line: deprecated
  local finder = util.root_pattern(unpack(patterns))

  local bufname = vim.api.nvim_buf_get_name(bufid)
  local bufdir = vim.fn.fnamemodify(bufname, ':p:h')

  return finder(bufdir) ~= nil
end

return M
