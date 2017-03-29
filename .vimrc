" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

set nocompatible
filetype plugin on 
filetype plugin indent on    " enables filetype detection
set omnifunc=syntaxcomplete#Complete
syntax enable

"Useful file completion stuff
set path+=**
set wildmenu

call plug#begin('~/.vim/plugged')

"git interface
Plug 'tpope/vim-fugitive'

Plug 'jtratner/vim-flavored-markdown'

"python sytax checker
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/Pydiction'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'

"tag stuff
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

""code folding
Plug 'tmhedberg/SimpylFold'

" Latex
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'scrooloose/nerdtree'
Plug  'ledger/vim-ledger'
Plug 'jmcantrell/vim-virtualenv'

Plug 'vimwiki/vimwiki'
Plug 'blindFS/vim-taskwarrior'

call plug#end()

"Navigate panes with Ctrl-J/K/L/H
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Disable the arrow keys
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

imap <Tab> <C-X><C-O>

set tags=./tags,tags;
let g:autotagTagsFile="tags"
nmap <F8> :TagbarToggle<CR> 

"Color Scheme and Visability
set background=dark
colorscheme elflord
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10

set cursorline
nnoremap <Leader>c :set cursorline!<CR>
hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=white

let g:SimpylFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_path_to_python_interpreter="/usr/bin/python2"

" Ledger Stuff
let g:ledger_bin="/home/cgiacofei/ledger/ledger"
let g:ledger_maxwidth = 80
let g:ledger_align_at = 78
let g:ledger_fillstring = '    -'
let g:ledger_detailed_first = 1

"I don't like swap files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"turn on numbering
set relativenumber
set number

"NERD Tree, start open if no file specified`
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

"VimWiki Stuff
let g:vimwiki_list = [{'path': '~/vimwiki/',
                     \ 'auto_tags': 1,
                     \ 'syntax': 'markdown',
                     \ 'ext': '.md',
                     \ 'auto_toc': 1}]

let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 2
let g:vimwiki_folding = 'syntax'

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use UNIX (\n) line endings.
au BufNewFile *.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

let g:pydiction_location = '/home/user/.vim/plugged/Pydiction/complete-dict'

"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 

"-------------------------------
" The Rest of the File
"-------------------------------
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Change directory to the current buffer when opening files.
set autochdir

