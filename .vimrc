set nocompatible                  " be iMproved
filetype off                      " required!

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

syntax on                         "syntax highlighting

" remappings
let mapleader=","                 "remap leader to ,
set pastetoggle=<F2>
noremap <silent> <leader>l :noh<CR>
noremap <silent> <leader>o :tab sp<CR>
noremap <silent> <leader>x :tabc<CR>
map <leader>= mzgg=G`z<CR>

" splits                          "much more 'vim' like
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <c-w>l :vertical res +20<cr>
nmap <c-w>h :vertical res -20<cr>
nmap <c-w>j :res -20<cr>
nmap <c-w>k :res +20<cr>

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

" ====== airline ======
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

let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'
let g:airline_section_x = ''
let g:airline_section_y = '%{&filetype}'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled = 0

" ====== bufferline ===
let g:bufferline_echo = 0

" ====== ctrlp ========

" ====== NERDTree =====
map <Leader>m :NERDTreeToggle<CR>

" ====== EasyMotion =====
let g:EasyMotion_leader_key = '<Leader>'

"" ====== Theme ======
colorscheme hybrid

highlight clear SignColumn              "gitgutter color

set list listchars=tab:»·,trail:·       "trailing whitespace

"" ======= use clipboard ========

if system("uname") == "Darwin\n"        "mac clipboard on yank, hooray!
  set clipboard=unnamed
endif

"" ======= youcompleteme ======

"" ======= fugitive ===========
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit -a<cr>

"" ======= tabular ============
vmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t: :Tabularize /:<CR>

"" ======= go ===============
filetype off
filetype plugin indent off
set rtp+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

"" ======== vundle ==========

if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
" original repos on github
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'godlygeek/tabular'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'noahfrederick/vim-hemisu'
NeoBundle 'vim-scripts/ParseJSON'

set rtp+=~/Dev/openrefactory-vim/
set rtp+=$GOPATH/src/go-oracle-vim

filetype plugin indent on
NeoBundleCheck

