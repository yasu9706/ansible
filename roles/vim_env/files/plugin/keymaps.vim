" key mappings
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>

" move buffers.  https://zenn.dev/sa2knight/articles/e0a1b2ee30e9ec22dea9
" other idea: <C-j> :bprev<CR>
"           : [b    :bprev<CR>
nnoremap <Up>   :bprev<CR>      
nnoremap <Down> :bnext<CR>      

" 上下キーのデフォルトの挙動を別のキーで代替
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" """""""""""""""""""""""""""""""""
" experimental
" https://stackoverflow.com/questions/56052/best-way-to-insert-timestamp-in-vim
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" practical vim ch13, or  https://github.com/nelstrom/vim-visual-star-search
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
        let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction



