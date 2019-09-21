augroup filetypedetect
  autocmd BufNewFile,BufRead *.asm,*.inc,*.mac,*.i,*.m,*.S,*.s if !did_filetype() | let &filetype = g:asmsyntax | endif
  autocmd BufNewFile,BufRead ~/.config/yamllint/config,.yamllint setfiletype yaml
  autocmd BufNewFile,BufRead */playbooks/*.yaml,*/playbooks/*.yml setfiletype yaml.ansible
augroup END
