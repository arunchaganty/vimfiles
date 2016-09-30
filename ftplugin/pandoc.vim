function! RenderSelection() range
	silent normal `<"*y`>
  " Save snippet to random directory
  redir! >/tmp/vim-pandoc.md
  echo @*
  redir END
  " Call `render` on snippet
  !render "/tmp/vim-pandoc.md" latex jmlr
  " Open the file
  !evince "/tmp/vim-pandoc.pdf"&
endfunction

function! RenderAsHTML() range
	silent normal `<"*y`>
  " Save snippet to random directory
  redir! >/tmp/vim-pandoc.md
  echo @*
  redir END
  " Call `render` on snippet
  !render "/tmp/vim-pandoc.md" html
  " Open the file
  !open "/tmp/vim-pandoc.html"&
endfunction

function! GetLink() 
  let url = getline(line('.'))
  python << EOF
import re
import os, subprocess
m = re.match(r"(\[[^\]]+\]\()?(?P<url>[^(][^\[\]]*[^)])\)?", vim.current.line.strip() )
if m is not None:
  url = m.groupdict()["url"].strip()
  print ("python3 %s/.vim/scripts/papernet.py --open '%s'"%(os.environ['HOME'], url))
  subprocess.Popen( ("python3 %s/.vim/scripts/papernet.py --open '%s'"%(os.environ['HOME'], url)).split() )
else:
  print "invalid url"
EOF
endfunction


function! PrintLink() 
  let url = getline(line('.'))
  python << EOF
import re
import os, subprocess
m = re.match("(\[[^\]]+\]\()?(?P<url>[^()\[\]]*)\)?", vim.current.line )
if m is not None:
  url = m.groupdict()["url"]
  print url
  os.system( "python3 ~/.vim/scripts/papernet.py '%s' | xargs print-zouk"%(url) )
else:
  print "invalid url"
EOF
endfunction

set textwidth=70
set tabstop=2
set shiftwidth=2
set makeprg=render\ %:p\ latex\ jmlr

map \f                  :call GetLink()<CR>
map \F                  :call PrintLink()<CR>
vmap \pp                :call RenderSelection()<CR>
vmap \ph                :call RenderAsHTML()<CR>

