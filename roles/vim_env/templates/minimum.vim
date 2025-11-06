" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
let g:skip_defaults_vim = 1

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

if has("syntax")
    syntax on
endif


" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)


" runtime! vimrc.en/*
runtime! plugin/*.vim
let @r = ':source %:echo ".vimrc reloaded"'

"set encoding=utf-8
scriptencoding utf-8


" colorscheme
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

"set statusline=%f%m%h\ %<|%=\ %8.9l[%p%%]

packloadall
silent! helptags All
set background=dark
filetype plugin on
filetype plugin indent on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2
set number
set relativenumber
set cursorline
set hlsearch
set smartindent
set clipboard+=unnamed
if !has('gui_running')
    set t_Co=256
endif
set noshowmode
set wildmenu
set ttimeout
set ttimeoutlen=0

" let increment hexadecimal not as hex, but as mere decimal
" just comment out if you need to increment as hex
set nf=alpha,hex

" experimental: show line width 80 characters
set colorcolumn=80


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax highlightning inside markdown codeblock;
" vim loads $VIMRUNTIME/filetype.vim to analyze filetype,
" so in order to check what filetype is available, see $VIMRUNTIME/filetype.vim
let g:markdown_fenced_languages = [
            \ 'html',
            \ 'python',
            \ 'ruby',
            \ 'vim',
            \ 'bash',
            \ 'yaml',
            \ 'systemd',
            \ 'messages',
            \ 'dockerfile', 
            \ 'nginx',
            \ 'xml',
            \ 'dosini'
            \ ]

set wildmode=longest,full
