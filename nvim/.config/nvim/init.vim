set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle'}
Plug 'vim-scripts/c.vim', { 'for': ['c', 'c++'] }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'c++'] }
Plug 'vhda/verilog_systemverilog.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'tweekmonster/deoplete-clang2'
"let g:deoplete#enable_at_startup = 1
"Plug 'neoclide/coc.nvim'
"Plug 'Valloric/YouCompleteMe'
"Plug 'tranvansang/octave.vim'
"Plug 'fatih/vim-go'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'benekastah/neomake'

" plug from http://vim-scripts.org/vim/scripts.html

" All of your Plugins must be added before the following line
call plug#end()            " required

" Put your non-Plugin stuff after this line
set laststatus=2
syntax enable

" Allows writing to files with root priviladges
cmap w!! w !sudo tee % > /dev/null

" Show line numbers
 set number

filetype plugin indent on
"" Do 4 spaces instead of a tab. AKA Reasonable defaults
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


" Set textwidth
set textwidth=92

" Set column width
if exists('+colorcolumn')
    set colorcolumn=+1
endif

"" NeoMake
"let g:neomake_open_list = 2
"call neomake#configure#automake('nw', 1000)


" Vim-Airline Configurations
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_theme='dark_minimal'


" Vim-CPP-Enhanced-Highlight
let g:cpp_experimental_template_highlight = 1
let g:cpp_class_scope_highlight=1

set cursorline
set guicursor+=a:blinkon0
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildignorecase

set wrap
set linebreak
set autoindent
set smartindent
set copyindent

" Allow modified buffers to be hidden
 set hidden

" " Open windows to the right and below
 set splitbelow
 set splitright

" " Set leader to ,
 let mapleader = ","

" " Don't use swap files.  Move other files to ~/.vim
 set swapfile!
 set backupdir+=~/.vim/backup//
 if exists('&undofile')
   set undodir=~/.vim/undo//
       set undofile
       endif

" Keybindings to switch buffers in vim
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
  nmap <leader>- <Plug>AirlineSelectPrevTab
  nmap <leader>+ <Plug>AirlineSelectNextTab


"Enable TagBar Keybinding
nmap <F8> :TagbarToggle<CR>

