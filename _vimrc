" .vimrc by Rafal Rawicki, rafal@rawicki.org
" Modified: 6th November 2009

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.

set nocompatible

" Fix for non xterm terminal

nmap ^[[5;5~ <C-PageUp>
nmap ^[[6;5~ <C-PageDown>

" Syntax highlighting and line numbering

syntax on
set bg=dark
set t_Co=256
colorscheme molokai
set nu

" For too long lines

highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%81v.*/

" Auto indentation

set autoindent
set cindent

set tabstop=4
"set softtabstop=4
set shiftwidth=4

"set expandtab

" Smart scrolling (10 lines before viewport ends)

set so=10

" Search options

set hlsearch
set incsearch

" Backspace behaviour
" Yes, it seems to be uncomfortable, but enforces a good practices in working
" wth Vim
set backspace=eol,start

" Backup

set nobackup

set history=50  " keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

set autowrite

" Fixes for my common typos.

ab Q q
ab W w
ab Wq wq
ab Wqa wqa
ab Qa qa

" Default encoding

set enc=utf-8
set tenc=utf-8

" Autofolding

"set fdm=indent

"set fml=10
"set fdn=4
"set foldlevel=1
"set foldnestmax=3

au Filetype tex let g:tex_fold_enabled=1
au Filetype tex set fdm=syntax
au BufNewFile,BufRead *.nc set filetype=cpp

au Syntax def runtime!  syntax/cpp.vim

set shortmess=atI

iab #i #include

filetype plugin indent on

" Highlight and remove extra whitespace

:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

set laststatus=2

call pathogen#infect()

