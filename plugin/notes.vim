" Find the right file
function! VimwikiInteractiveSearch()
  call inputsave()
  let pattern = input('Search wiki: ')
  call inputrestore()
  call vimwiki#base#search(pattern)
  lopen
endfunction

noremap <Leader>wo <Esc>:e <C-R>=vimwiki#vars#get_wikilocal('path')<CR>
noremap <Leader>ww :exec ":FZF " . vimwiki#vars#get_wikilocal('path')<CR>
noremap <Leader>w\ :call VimwikiInteractiveSearch()<CR>

function! VimwikiNewTemplateNote(prompt, prefix)
  call inputsave()
  let name = input(a:prompt)
  call inputrestore()

  if name == ""
    return
  endif

  let fname = vimwiki#vars#get_wikilocal('path') . a:prefix . strftime("%Y-%m-%d-") . name->tolower()->tr(" ", "-")
  exec ":edit " .fname . ".wiki"
endfunction

" Create a new meeting notes
noremap <Leader>wm :call VimwikiNewTemplateNote("Meeting with? ", "google/meetings/")<CR>
noremap <Leader>we :call VimwikiNewTemplateNote("Email to? ", "google/emails/")<CR>
noremap <Leader>wN :call VimwikiNewTemplateNote("Note about? ", "google/notes/")<CR>
