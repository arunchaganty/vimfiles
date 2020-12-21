set history=1000        " Store a nice long history file
set cf                  " Will ask for confirmation instead of failing when quiting from unsaved buffers
set clipboard+=unnamed  " Shares it with the session's clipboard (in the middle-button click paste
set hid                 " Don't force save (*) (Let's you switch between buffers)
set ml                  " Use mode lines

let g:netrw_list_hide="\.o$,\.swp$"

" Enable filetype
filetype on
filetype plugin on
filetype indent on

