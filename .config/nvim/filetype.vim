augroup filetypedetect
  autocmd BufNewFile,BufRead *.do,*.shar,~/.logout,~/.shrc setfiletype sh
  autocmd BufNewFile,BufRead gitconfig setfiletype gitconfig
augroup END
