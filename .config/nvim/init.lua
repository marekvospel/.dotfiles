vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes:1'

-- Indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.lazy')
