set nocompatible

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

set number

" set cc=120

set wildmode=longest,list

filetype plugin indent on

syntax on

set cursorline

aunmenu PopUp.How-to\ disable\ mouse
aunmenu PopUp.-1-

set title
set titlestring=vim\ %t\ %M
set icon
set iconstring=vim
" /usr/share/icons/Numix-Circle/48/apps/vim.svg
" %F full file name

set noswapfile

set backupdir=~/.cache/vim

" background color #2F343F

" plug
" call plug#begin()

" Plug 'ghifarit53/tokyonight-vim'

" call plug#end()

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 0
let g:tokyonight_transparent_background = 0
" let g:tokyonight_menu_selection_bakground = green
let g:tokyonight_disable_italic_comment = 1

" colorscheme tokyonight

" hi Normal guibg=#2F343F
hi Comment guifg=#8890b0

" key mapping

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" /ref see https://stackoverflow.com/a/6053341

" exit terminal on esc
tnoremap <Esc> <C-\><C-n>
" /ref see https://vi.stackexchange.com/a/4922

" lua require("config.lazy");

cnoreabbrev sh rightbelow split 
cnoreabbrev s rightbelow vsplit 

cnoreabbrev term rightbelow vsplit term://bash
" cnoreabbrev tv rightbelow vsplit term://bash
" :belowright :vertical :terminal
cnoreabbrev termh rightbelow split term://bash
" :belowright :terminal

" also see https://vim.fandom.com/wiki/Highlight_unwanted_spaces
cnoreabbrev tabshow /\t

cnoreabbrev searchclear noh

command -nargs=1 -complete=file -bar VRef :rightbelow :vsplit <args>
" cnoreabbrev termt :rightbelow :vsplit :terminal

set shell=bash\ -i

set lcs+=space:·
cnoreabbrev sp set list
cnoreabbrev nosp set nolist
" set list
