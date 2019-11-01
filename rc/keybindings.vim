" Keybindings
" Motion keys:
" (Warning! Can be dangerous for beginners)
" Up - File Browser
" Left - Left buffer 
" Down - Preview Window "TODO: Toggle quickfix
" Right - Right Buffer
" Space - Move down a page
" Backspace - Move up a page

nnoremap <c-j> <ESC>:bn<CR> 
nnoremap <c-k> <ESC>:bp<CR> 
" Commenting these out in case your instincts tell you to use the arrow
" keys. Shame on you.
"nnoremap <up> <ESC>:Explore<CR><ESC><C-W><C-W> 
"nnoremap <left> <ESC>:bp<CR> 
"nnoremap <down> <ESC>:Tlist<CR> 
"nnoremap <right> <ESC>:bn<CR>
nnoremap <Space> <PageDown>
nnoremap <Backspace> <PageUp>

" Format the paragraph (or the current selection) at once
nnoremap Q gqap
vnoremap Q gq

" Quickfix
" Ctrl-h  -  Move the previous entry
" Ctrl-l  -  Move the next entry
nnoremap <C-h> :cprev <CR>
nnoremap <C-l> :cnext <CR>

" Hotkeys
"    F2   -  write file without confirmation
"    F3   -  make
"    F4   -  nohl
"    F5   -  toggle paste
"    F6   -  GenTags
"    F7   -  Open tag in preview window
"    F8   -  TagList
"    F9+  -  GNOME <reserved>
"    F12  -  ROT-13 encrypt the file

map   <silent> <F2>    :silent write<CR>
map   <silent> <F3>    :silent make<CR> :copen<CR>
map   <silent> <F4>    :nohl<CR>
set   pastetoggle=<F5>

imap  <silent> <F2>    <Esc>:silent write<CR>
imap  <silent> <F3>    <Esc>:silent make<CR>
imap  <silent> <F4>    <Esc>:nohl<CR>

" Copy the current position, into previously accessed buffer
map \o                 <Esc>:call CopyCat() <CR>
map ,e                  <Esc>:e <C-R>=expand("%:h")<CR>/
map ,f                  <Esc>:set foldlevel=0<CR>
map ,F                  <Esc>:set foldlevel=100<CR>

" Map jj for escape
imap jj <Esc>

" Map \d for diary
:map <Leader>d <Plug>VimwikiMakeDiaryNote

:map <Leader>s :Sscratch<CR>
