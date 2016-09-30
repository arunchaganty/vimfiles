" Arun Chaganty
" Some useful sets of commands

" Generate CTags and rebuild the CScope database. The combo can then be
" "hot-keyed". (*)
function! GenTags()
    !ctags -R .
    " !cscope -bR
    " cscope reset
endfunction

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

