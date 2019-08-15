syntax on	" #0
set wrapmargin=8	" #0
set textwidth=80	" #3
set number	" #0
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2	" #1
"set filetype indent on	" #1

nmap OO O<Esc>	" #2
nmap oo o<Esc>	" #2

"set textwidth for specific filetypes
au BufRead,BufNewFile *.md setlocal textwidth=80 " #3

set tabstop=4
set softtabstop=4 expandtab
set shiftwidth=4 

" 0. https://null-byte.wonderhowto.com/how-to/intro-vim-unix-text-editor-every-hacker-should-be-familiar-with-0174674/
" 1. https://stackoverflow.com/questions/158968/changing-vim-indentation-behavior-by-file-type
" 2. https://stackoverflow.com/questions/16134457/insert-a-newline-without-entering-in-insert-mode-vim
" 3. https://thoughtbot.com/blog/wrap-existing-text-at-80-characters-in-vim
