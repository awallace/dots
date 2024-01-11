set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set wildignore+=*.o,*/.git,*/tmp,*/node_modules/*,*/dist

lua require('plugins')

source ~/.vimrc
