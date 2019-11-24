augroup filetypedetect
  autocmd BufNewFile,BufRead *.do setfiletype sh
  autocmd BufNewFile,BufRead *.i,*.m,*.s if !did_filetype() | let &filetype = g:asmsyntax | endif
  autocmd BufNewFile,BufRead */playbooks/*.yaml,*/playbooks/*.yml setfiletype yaml.ansible
  autocmd BufNewFile,BufRead ~/.config/yamllint/config,.yamllint setfiletype yaml
augroup END
