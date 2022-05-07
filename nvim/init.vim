"!
" .dotfiles v2.0
" (c) 2022 Marek Vospěl
"

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-devicons'

Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'airblade/vim-gitgutter'

Plug 'wakatime/vim-wakatime'

call plug#end()

"NerdTree
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeMinimalUI=1

" Devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" NerdTree git
let g:NERDTreeGitStatusWithFlags = 0
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ 'Staged'    : '+',
  \ 'Modified'  : '*',
  \ 'Untracked' : '.',
  \ 'Clean'     : ' ',
  \ 'Renamed'   : '>',
  \ 'Unmerged'  : '=',
  \ 'Deleted'   : '-',
  \ 'Dirty'     : ' ',
  \ 'Ingored'   : ' ',
  \ 'Unknown'   : '?',
  \ }

" coc extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-rust-analyzer',
  \ ]

" Themes
colorscheme onedark

" Spaces
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab

" Line numbers
set nu

" Qall
:command Q :qall
