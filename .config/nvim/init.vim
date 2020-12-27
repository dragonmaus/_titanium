" Settings
let g:is_ksh = 1

" Disable unwanted plugins
let g:loaded_gzip = 1
let g:loaded_netrwPlugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_zipPlugin = 1

" Options
set backupcopy=yes
set colorcolumn=81,+1
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set ignorecase
set nojoinspaces
set list
set listchars=eol:$,tab:>-,space:·,trail:+,extends:»,precedes:«,nbsp:_
set nomodeline
set modelines=0
set number
set numberwidth=1
set shada='0,<0,f0,h,s100
set showmatch
set noshowmode
set sidescrolloff=1
set smartcase
set tabpagemax=100
set termguicolors
set title
set nowrapscan

" Plugins
runtime! plug.vim
