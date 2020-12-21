" Find the right file
function! VimwikiInteractiveSearch()
  call inputsave()
  let pattern = input('Search wiki: ')
  call inputrestore()
  call vimwiki#base#search(pattern)
  lopen
endfunction

noremap <Leader>wn <Esc>:e <C-R>=vimwiki#vars#get_wikilocal('path')<CR>
noremap <Leader>ww :exec ":FZF " . vimwiki#vars#get_wikilocal('path')<CR>
noremap <Leader>w\ :call VimwikiInteractiveSearch()<CR>
