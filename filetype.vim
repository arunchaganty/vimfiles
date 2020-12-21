autocmd BufNewFile,BufRead *.txt set filetype=human
autocmd BufNewFile,BufRead *.md set filetype=human.pandoc
autocmd BufNewFile,BufRead *.tex set filetype=human.tex
autocmd BufNewFile,BufRead *.wiki set filetype=human.wiki
autocmd BufNewFile,BufRead *.conll set filetype=conll
autocmd BufEnter,FileType haskell compiler ghc
autocmd BufEnter,FileType python compiler pylint
