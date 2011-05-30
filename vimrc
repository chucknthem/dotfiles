set nocompatible
syntax on
set tw=2 sw=2 tw=80 ai smarttab
highlight comment ctermfg=2
set expandtab

" keep 3 lines from the edge of the screen
set so=3

set modeline
set modelines=3

" enable mouse mode
" set mouse=a

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

" auto complete
set completeopt=longest,menuone
set path=.,/usr/include,/usr/include/*

"draws a line under the cursor
set cursorline

"show row and column number
set ruler

" show line numbers
" set number


" If a space is missing after a // comment in c++ file, highlight it red.
autocmd Filetype cpp highlight MissingSpace ctermbg=red guibg=red
autocmd Filetype cpp match MissingSpace "[/][/][^ ]"
autocmd Filetype cpp 3match MissingSpace "[^ ][ ][/][/]"

" Highlight extra whitespace at the end of lines in cpp files.
autocmd Filetype cpp highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
autocmd Filetype cpp 2match ExtraWhitespace /\s\+$/

" read .tem files as .cpp files
au BufNewFile,BufRead *.tem	set ft=cpp

" Prevent F1 from showing :h
nmap <F1> <nop>
imap <F1> <nop>

" Expand #i to #include and #d to #define in c and cpp files.
au FileType c,cpp iab #i #include| iab #d #define| set foldmethod=marker


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
if has('cscope')
	set cst csverb 
	if has('quickfix')
		set csqf=s-,c-,d-,i-,t-,e-
	endif
	if version < 700
		cnoreabbrev csa cs add
		cnoreabbrev csf cs find
		cnoreabbrev csk cs kill
		cnoreabbrev csr cs reset
		cnoreabbrev css cs show
		cnoreabbrev csh cs help
	else
		cnoreabbrev <expr> csa
		 \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs add'  : 'csa')
		cnoreabbrev <expr> csf
		 \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find' : 'csf')
		cnoreabbrev <expr> csk
		 \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs kill' : 'csk')
		cnoreabbrev <expr> csr
		 \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs reset' : 'csr')
		cnoreabbrev <expr> css
		 \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs show' : 'css')
		cnoreabbrev <expr> csh
		 \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs help' : 'csh')
	endif
	command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
	if has('autocmd')
		au VimLeave * cs kill -1
	endif
endif
