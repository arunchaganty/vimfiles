function! RoundNumber()
  .perldo s/(\d+\.\d+)/sprintf "%.3f", $1/eg
endfunction
