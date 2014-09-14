set nocompatible                  " be iMproved
filetype off                      " required!

set encoding=utf-8                "b/c Pike won

set number                        "Line numbers within relative
set relativenumber                "awesome-sauce
set backspace=indent,eol,start    "it's 2014 we can use backspace meow
set history=1000                  "know your history
set showcmd                       "show incomplete commands
set showmode                      "show current mode
set visualbell                    "stop yelling at me
set autoread                      "reload files changed outside vim
set t_Co=256                      "why god?

" remappings
let mapleader=","                   "remap leader to ,
set pastetoggle=<F2>                "quit indenting yo shit
noremap <silent> <leader>l :noh<CR> 
noremap <silent> <leader>d :bd<CR>

" splits                          "only you can prevent emacs pinky
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

set noswapfile                    "yes I made those changes
set nobackup                      "no I don't need 7 trillion copies
set nowb                          "stop yelling at me

" ====== Indentation =====

set autoindent                    "why would you not want this? masochist!
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2                     "because 2 spaces is objectively the best
set expandtab

" wrap text, markdown files -- thanks thoughtbot
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

  " Enable spellchecking for Markdown
  autocmd BufRead,BufNewFile *.md setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

set nowrap                          " let a line be a line
set linebreak                       " stahp

" ====== Folding ==========
set foldmethod=indent               " too lazy to tag
au BufRead * normal zR

" ====== scrolling ========
set scrolloff=8                       "keep a reasonable padding at edges
set sidescrolloff=15
set sidescroll=1

" ====== airline ==========
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
let g:airline_section_x = ''                      "who cares if utf8?
let g:airline_section_y = '%{&filetype}'          "put ^ here
let g:airline#extensions#whitespace#enabled = 0   "shut up I have gofmt
let g:airline#extensions#hunks#enabled = 0        "wat

" ====== bufferline ===
let g:bufferline_echo = 0            "louuuuud noises

" ====== ag / ctrlp mods ========
if executable('ag')
  " use silver searcher for grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in CtrlP because ain't nobody got time fo dat
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  "don't even have to leave to see new files!
  let g:ctrlp_use_caching = 0
endif

" ====== fasd ===========
" :Z - cd to recent / frequent directories
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

"" ====== Theme ======
hi clear SignColumn                 "gitgutter color
set list listchars=tab:»·,trail:·   "trailing whitespace, die 4 space tabs!

"" ======= use clipboard ========
set clipboard=unnamedplus           "this doesn't work anyway!

" ======== synstastic =========
let g:syntastic_check_on_wq = 0     "nobody likes you c++, go away

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
Bundle 'fatih/vim-go'

"install above bundles if fresh system
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif

" =========== go stuffs ============
set rtp+=$GOPATH/src/golang-refactoring.org/go-doctor/cmd/godoctor/vim
let g:go_fmt_command = "goimports"

" ========== theme all the things ==
" have to do this after Bundle...
" TODO(reed): get your fucking shit together man put bundle at top
colorscheme hybrid
filetype plugin indent on
syntax on

" see through your computer's soul
hi Normal ctermfg=250 ctermbg=none 
