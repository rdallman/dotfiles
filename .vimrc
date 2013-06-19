set nocompatible                  " be iMproved
filetype off                      " required!

set pastetoggle=<F2>

set encoding=utf-8

set relativenumber                "Line numbers
set backspace=indent,eol,start    "Allow backspaces
set history=1000                  "long history
set showcmd                       "show incomplete commands
set showmode                      "show current mode
set visualbell                    "stop ringing
set autoread                      "reload files changed outside vim

syntax on                         "syntax highlighting

" remappings
let mapleader=","                 "remap leader to ,
noremap <leader>l :noh<CR>

" splits                          "much more 'vim' like
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow                    "naturally go right and down
set splitright

set mouse=a                       "allow scrolling

" ====== Search Settings ======

set incsearch                     "get next match while typing
set hlsearch                      "highlighting
set viminfo='100,f1               "save 100 marks, caps

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

" wrap text, markdown files
autocmd FileType text, markdown setlocal textwidth=78

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

set scrolloff=8                       "keep a reasonable padding at edges
set sidescrolloff=15
set sidescroll=1

" ====== Powerline ======
source ~/.vim/bundle/powerline/powerline/bindings/vim/plugin/powerline.vim
"python import sys; sys.path.append("/usr/local/lib/python2.7/site-packages/")
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2                      "always display statusline in all windows
let g:Powerline_symbols = 'fancy'
set noshowmode                        "hide default mode text
if ! has('gui_running')               "fix the slowness of powerline
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" ====== ctrlp ========

" ====== NERDTree =====

" ====== EasyMotion =====
let g:EasyMotion_leader_key = '<Leader>'

" ====== Theme ======
colorscheme hybrid

highlight clear SignColumn              "gitgutter color

set list listchars=tab:»·,trail:·

" ======= use clipboard ========

if system("uname") == "Darwin\n"
  set clipboard=unnamed
endif

" ======== color shit =======

let g:hybrid_use_Xresources = 1

" ======= youcompleteme ======

" ======= tabular ============
vmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a: :Tabularize /:<CR>


" ======== vundle ==========

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-markdown'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/powerline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-ruby/vim-ruby'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'w0ng/vim-hybrid'
Bundle 'godlygeek/tabular'
" vim-scripts repos
Bundle 'L9'
" non github repos
Bundle 'file:///Users/reed/Dev/openrefactory/OpenRefactory/org.openrefactory.vim.ui/openrefactory/'

filetype plugin indent on     " required!
