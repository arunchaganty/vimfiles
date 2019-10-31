" expand a paper link.
function! InsertPaperLink()
  silent normal `<"*y`>
  python << EOF
import os
import urllib

phrase = vim.eval("@*")
phrase.split()
url = "http://www.google.com/search?" + urllib.urlencode( {"q":phrase} )
os.system( "gnome-www-browser " + url )
EOF
endfunction

map \pi                  :call InsertPaperLink()<CR>

