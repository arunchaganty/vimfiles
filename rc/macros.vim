" A list of useful functions with keybindings
" This is separate from plugins since I guess they're all my own.

" A bit of a hack. Use this to open and close the "quickfix" window with one
" commmand (again hotkey-ed) which I have found to be really useful.
let s:qf_toogle = 0
function! QuickFixToggle ()
    if (s:qf_toogle)
        silent cclose
        let s:qf_toogle = 0
    else
        silent copen
        let s:qf_toogle = 1
    endif
endfunction
map \q :call QuickFixToggle()<CR>

" A simple function to 'copy' the current window (i.e. its file and
" position) in another window.
" Author: Arun Tejasvi Chaganty <arunchaganty@gmail.com>
"
function! CopyCat ()
    let file = expand ('%:p')
    let pos = getpos('.')
    let pos[0] = 0
    wincmd p
    exe "b" file
    call setpos ('.', pos)
endfunction
map \o :call CopyCat()<CR>


" Very simply, google the current selection
function! GoogleThis() 
  silent normal `<"*yv`>
  python3 << EOF
import os
from urllib.parse import urlencode
import platform

phrase = vim.eval("@*")
if phrase.startswith("http://"):
  url = phrase
else:
  url = "http://www.google.com/search?" + urlencode( {"q":phrase} )

if platform.system() == "Linux":
  os.system( "gnome-www-browser " + url )
elif platform.system() == "Darwin":
  os.system( "open " + url )
EOF
endfunction

vmap \gg                  :call GoogleThis()<CR>


" Evaluate the current selection in python
function! InlineEval() 
  silent normal `<"*yv`>
  python3 << EOF
import vim 
expr = vim.eval('@*')
ans = eval(expr)
vim.command("normal `<cv`>" + str(ans) + "\n")
EOF
endfunction

vmap <C-e>                  :call InlineEval()<CR>

" Simple script to round numbers
function! RoundWord()
  exe 's#\v[0-9]+\.[0-9]{3,}#\=round(str2float(submatch(0))*10)/10#'
endfunction
nmap \rw                     :call RoundWord()<CR>

function! ConvertPercentage()
  exe 's#\v[0-9]+\.[0-9]{3,}#\=round(str2float(submatch(0))*1000)/10#'
endfunction
nmap \rp                     :call ConvertPercentage()<CR>
