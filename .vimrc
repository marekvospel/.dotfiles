""" Vimrc
""" by vospel | v1

""
"" Plugins
""

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'

call plug#end()

""
"" Appearance
""

" Enable syntax highlighting
syntax on

" Show line numbers
set nu

" Color scheme
colorscheme desert 
hi Constant	ctermfg=1
hi Constant	guifg=#ed1515


" Lightline plugin configuration
set noshowmode " Don't show -- INSERT --, -- VISUAL -- etc.
set laststatus=2
let g:lightline = { 'colorscheme':'wombat' }


""
"" Behaviour
""

" DO NOT FUCKING BEEP
set noerrorbells

" Set tabs to 2 spaces wide
set tabstop=2
set softtabstop=2
set shiftwidth=2

" When yanking, pasting etc. use clipboard
set clipboard=unnamedplus

" automatically shift code in brackets 
set smartindent

" Disable text wrapping
set nowrap

" Search instantly
set incsearch
