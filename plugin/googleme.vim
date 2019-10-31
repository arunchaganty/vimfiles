
function! GoogleThis() 
  silent normal `<"*yv`>
  python << EOF
import os
import urllib
import platform

phrase = vim.eval("@*")
if phrase.startswith("http://"):
  url = phrase
else:
  url = "http://www.google.com/search?" + urllib.urlencode( {"q":phrase} )
if platform.system() == "Linux":
  os.system( "gnome-www-browser " + url )
elif platform.system() == "Darwin":
  os.system( "open " + url )
EOF
endfunction

map \gg                  :call GoogleThis()<CR>

function! GoogleScholarThis() 
  silent normal `<"*yv`>
  python << EOF
import os
import urllib
import platform

phrase = vim.eval("@*")
if phrase.startswith("http://"):
  url = phrase
else:
  url = "http://scholar.google.com/scholar?" + urllib.urlencode( {"q":phrase} )
if platform.system() == "Linux":
  os.system( "gnome-www-browser " + url )
elif platform.system() == "Darwin":
  os.system( "open " + url )
EOF
endfunction

map \gs                  :call GoogleScholarThis()<CR>

