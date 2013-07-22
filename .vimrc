set nocompatible                  " be iMproved
filetype off                      " required!

set shell=/bin/bash               "for fish

set pastetoggle=<F2>

set encoding=utf-8

set number                        "Line numbers within relative
set relativenumber                "awesome-sauce
set backspace=indent,eol,start    "Allow backspaces
set history=1000                  "long history
set showcmd                       "show incomplete commands
set showmode                      "show current mode
set visualbell                    "stop ringing
set autoread                      "reload files changed outside vim
set t_Co=256
set lazyredraw

syntax on                         "syntax highlighting

" remappings
let mapleader=","                 "remap leader to ,
noremap <silent> <leader>l :noh<CR>
noremap <silent> <leader>o :tab sp<CR>
noremap <silent> <leader>x :tabc<CR>

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

filetype plugin indent on

" wrap text, markdown files
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd BufRead,BufNewFile *.md setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

set nowrap
set linebreak

" ====== Folding =========
set foldmethod=indent
au BufRead * normal zR

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
set laststatus=2                      "always display statusline in all windows
set noshowmode                        "hide default mode text
if ! has('gui_running')               "fix the slowness of powerline
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" ====== airline ======
let g:airline_fugitive_prefix = '⎇   '
let g:airline_linecolumn_prefix = '␊ '

" ====== ctrlp ========

" ====== NERDTree =====

" ====== EasyMotion =====
let g:EasyMotion_leader_key = '<Leader>'

" ====== Theme ======
colorscheme jellybeans                  "pretty colors
"let g:hybrid_use_Xresources = 1

highlight clear SignColumn              "gitgutter color

set list listchars=tab:»·,trail:·       "trailing whitespace

" ======= use clipboard ========

if system("uname") == "Darwin\n"        "mac clipboard on yank, hooray!
  set clipboard=unnamed
endif

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
"Bundle 'Lokaltog/powerline'
Bundle 'bling/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-ruby/vim-ruby'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'w0ng/vim-hybrid'
Bundle 'godlygeek/tabular'
Bundle 'nanotech/jellybeans.vim'
Bundle 'mileszs/ack.vim'
Bundle 'rdallman/openrefactory-vim'
" vim-scripts repos
"Bundle 'L9'
" non github repos
"Bundle 'file:///home/reed/Dev/openrefactory/openrefactory-vim/'
