" Matchit
let b:match_ignorecase = 1

" Sigh, no one uses cscope any more.
"source ~/.vim/rc/cscope.vim

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/local/bin/python3'

" open-pdf
let g:pdf_convert_on_edit=1
let g:pdf_convert_on_read=1
