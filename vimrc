set nocompatible
syntax on
set tabstop=3
set shiftwidth=3
highlight comment ctermfg=2 
"set expandtab

" backspace doesn't work the way it should in some versions of vim
" this fixes it.
set backspace=indent,eol,start

" save previous read position
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal g'\"" | endif
endif

if has("autocmd")
	filetype plugin indent on
endif

"draws a line under the cursor
set cursorline
"show row and column number
set ruler

" read .tem files as .cpp files
au BufNewFile,BufRead *.tem	set ft=cpp


" :help ft-vim-syntax <- docs on how to configure the syntax highligher

" :hi will generate a list of highlighting options.
" "   0  black       8 dark gray
" "   1  red         9 light red
" "   2  green      10 light green
" "   3  yellow     11 light yellow
" "   4  blue       12 light blue
" "   5  magenta    13 light magenta
" "   6  cyan       14 light cyan
" "   7  gray       15 white

"

