" ViMrc
" Arun Chaganty <arunchaganty@gmail.com>
"
" This vimrc is distributed into many smaller files.

"set runtimepath=$HOME/.vim,/usr/share/vim,/usr/share/vim/vim73/,/usr/share/vim/vimfiles/
let g:username="Arun Tejasvi Chaganty"

source ~/.vim/rc/pathogen.vim
source ~/.vim/macros/cmd.vim     " Quick convinence commands
source ~/.vim/rc/general.vim     " Toplevel options
source ~/.vim/rc/ui.vim          
source ~/.vim/rc/visual.vim
source ~/.vim/rc/formatting.vim
source ~/.vim/rc/fold.vim
source ~/.vim/rc/3rdparty.vim
source ~/.vim/rc/keybindings.vim
source ~/.vim/rc/abbr.vim

filetype plugin indent on
colorscheme xoria256
syntax on

" Autocmds
"autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
au! CursorHold *.[ch] nested call PreviewWord() 

" Disable ACP
"call acp#disable()
