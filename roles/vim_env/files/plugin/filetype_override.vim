""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" force filetype in specific path or filename
autocmd BufRead,BufNewFIle readme,README     set filetype=markdown
autocmd BufRead,BufNewFIle ~/.vim/vimrc**    set filetype=vim
autocmd BufRead,BufNewFIle ~/.ssh/config.d/* set filetype=sshconfig
autocmd BufRead,BufNewFIle ~/tmux/conf*/*    set filetype=tmux

