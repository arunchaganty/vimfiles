if exists("$BUFFERFILE")
    nnoremap <silent><leader>< :let @" = join(readfile($BUFFERFILE), "\n")<CR>
    nnoremap <silent><leader>> :call writefile( split(@", "\n"), $BUFFERFILE )<CR>
endif
