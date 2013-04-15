set nocompatible               		" be iMproved
filetype off                   		" required!

set encoding=utf-8

set number                				"Line numbers
set backspace=indent,eol,start		"Allow backspaces
set history=1000		            	"long history
set showcmd				                "show incomplete commands
set showmode				              "show current mode
set visualbell				            "stop ringing
set autoread				              "reload files changed outside vim	

syntax on				                  "syntax highlighting

let mapleader=","			            "remap leader to ,

set mouse=a                       "allow scrolling

" ====== Search Settings ======

set incsearch				              "get next match while typing
set hlsearch				              "highlighting
set viminfo='100,f1			          "save 100 marks, caps

" ====== Pesky Swaps =====

set noswapfile
set nobackup
set nowb

" ====== Indentation =====

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

set nowrap
set linebreak

" ====== Completion ======
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_STORE*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" ====== Powerline ======
set laststatus=2            "always display statusline in all windows
let g:Powerline_symbols = 'fancy'
set noshowmode              "hide default mode text
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" ====== NERDTree =====

map <C-m> :NERDTreeToggle<CR>

" ====== Theme ======
colorscheme molokai

highlight clear SignColumn


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-bundler'
Bundle 'tomasr/molokai'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'
" vim-scripts repos
Bundle 'L9'
" non github repos
" ...

filetype plugin indent on     " required!
