local set = vim.opt

set.mouse = ''

set.number = true
set.relativenumber = true

set.smartindent = false
set.smarttab = true

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = false

set.cursorline = true
set.cursorcolumn = true

set.path:append('**')
set.wildmenu = true
set.wildignore:append('**/node_modules/**')

set.guicursor:append('i:block')
set.encoding = 'UTF-8'

set.hlsearch = false
set.showmode = false
set.compatible = false

set.wrap = false

vim.cmd [[
	syntax enable
	filetype plugin on
	filetype plugin indent on
	filetype indent on
]]

