" LaTeX filetype

set makeprg=make
map <silent> <F6>   <Esc>:exe "!evince ". shellescape(expand("%:p:h:t")).".pdf &"<CR>

