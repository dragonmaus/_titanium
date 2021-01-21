" install plug.vim if it isn't already present
let s:plugfile = stdpath('data') . '/site/autoload/plug.vim'
if empty(glob(s:plugfile))
  silent execute '!curl -Lfks --create-dirs -o "' . s:plugfile . '" ' .
        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plug')

Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-eunuch'

call plug#end()
