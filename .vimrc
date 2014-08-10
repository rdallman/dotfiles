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
noremap <silent> <leader>d :bd<CR>

" splits                          "much more 'vim' like
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-=> <C-W>=

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

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " gofmt on save
  autocmd FileType go autocmd BufWritePre <buffer> Fmt

  " Enable spellchecking for Markdown
  autocmd BufRead,BufNewFile *.md setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

let g:gofmt_command="goimports"

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

let g:airline_theme = 'hybrid'
let g:airline_section_x = ''
let g:airline_section_y = '%{&filetype}'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled = 0  

" ====== bufferline ===
let g:bufferline_echo = 0

" ====== ctrlp ========
if executable('ag')
  " use silver searcher for grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in CtrlP
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  "yeah no cache is nice for new files, thanks ag
  let g:ctrlp_use_caching = 0
endif

" ====== fasd ===========
" Z - cd to recent / frequent directories
command! -nargs=* Z :call Z(<f-args>)
function! Z(...)
  let cmd = 'fasd -d -e printf'
  for arg in a:000
    let cmd = cmd . ' ' . arg
  endfor
  let path = system(cmd)
  if isdirectory(path)
    echo path
    exec 'cd ' . path
  endif
endfunction

" ====== EasyMotion =====
let g:EasyMotion_leader_key = '<Leader>'

"" ====== Theme ======

hi clear SignColumn              "gitgutter color

set list listchars=tab:»·,trail:·       "trailing whitespace

"" ======= use clipboard ========

set clipboard=unnamed

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
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

"" ======== vundle ==========

" install Vundle if fresh system
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-unimpaired'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'w0ng/vim-hybrid'
Bundle 'rking/ag.vim'

"install above bundles if fresh system
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif

" hooray internal tools
"set rtp+=/Users/reed/dev/OpenRefactory/org.openrefactory.ui.vim/openrefactory-vim
set rtp+=$GOPATH/src/golang-refactoring.org/go-doctor/extras/vim

filetype plugin indent on

colorscheme hybrid
hi Normal ctermfg=250 ctermbg=none
