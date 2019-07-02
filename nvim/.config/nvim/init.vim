set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
"Plugin 'neoclide/coc.nvim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'tranvansang/octave.vim'
"Plugin 'fatih/vim-go'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'benekastah/neomake'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'c.vim'
Plugin 'lua-support'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" the sparkup vim script is in a subdirectory of this repo called vim.
" pass the path to set the runtimepath properly.
" plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set laststatus=2
syntax enable

" Allows writing to files with root priviladges
cmap w!! w !sudo tee % > /dev/null
 set number

filetype plugin indent on
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

