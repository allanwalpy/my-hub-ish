local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim" vim.cmd.source(vimrc)

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('ghifarit53/tokyonight-vim')

vim.call('plug#end')

vim.cmd('colorscheme tokyonight')

