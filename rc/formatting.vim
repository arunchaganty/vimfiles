" ltcqn
set formatoptions=crqn  " Complicated options. Check :h fo-table
set cindent             " Only for C (but passes off in general)
set ignorecase          " Ignore case while searching
set smartcase           " But not if the searched term contains capitals
set tabstop=2           " Set the 'indent' to 2 spaces
set shiftwidth=2        " Change the 'shift' width (when you do >>) to 2
set textwidth=80        " Set the textwidth to 80. The formatting options will automatically split the line into a new one at this width
set colorcolumn="+".join(range(1, 80),",+") " Set colorcolumn to be every column after text width
" Set the color of the column to be something useful 
highlight ColorColumn ctermbg=242            
set expandtab           " Spaces instead of tabs == safer

set complete=.,w,b,u,t,i,k  " Order in which to populate the auto-complete box
