set number
set mouse=a
set clipboard+=unnamedplus
syntax enable
set showcmd
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set noshowmode
set cursorline

call plug#begin('~/.vim/plugged')

" Gruvbox Theme
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" Syntax
Plug 'ap/vim-css-color'
Plug 'vim-python/python-syntax'
Plug 'PotatoesMaster/i3-vim-syntax'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
let NERDTreeQuitOnOpen=1

let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>	

nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+y$
