function! OptionToConfig ()
  s#\v-\("([^"]+)", ([^)]+)\)#\1 = \2#
endfunction
