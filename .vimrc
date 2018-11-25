" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" Highlighting search pattern.
set hlsearch

" Coloring
colorscheme default
syntax on
set background=dark
colorscheme solarized

" Visual wrapping
set wrap
set linebreak
set nolist  " list disables linebreak

" Enable mouse integration
set mouse=a

" Disable backups
set nobackup
set nowritebackup
set noswapfile

" Autosave files on focus lost
au FocusLost * :wa

" Enable line numbers
set number
autocmd FileType markdown set nonumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key remmaping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use `sed -n l` in your shell to identify Alt key mapping
" ^[[1;9D  ---> <Esc>[1;9D
"
" Reduce timeout
set timeoutlen=1
set ttimeoutlen=1

" Move lines up/down
nnoremap <Esc>j :m .+1<CR>==
nnoremap <Esc>k :m .-2<CR>==
nnoremap <Esc>[1;3B :m .+1<CR>==
nnoremap <Esc>[1;3A :m .-2<CR>==

"inoremap <Esc>j :m .+1<CR>==       " TODO: don't know how to
"inoremap <Esc>k :m .-2<CR>==       " - map to simultaneous key-press 
"inoremap <Esc>[1;3B :m .+1<CR>==   " - distinguis ALT and ESC keys
"inoremap <Esc>[1;3A :m .-2<CR>==   " - or set negligible timeout

" Copy lines up/down
nnoremap <Esc>J VyP
nnoremap <Esc>K Vyp
nnoremap <Esc>[1;4A VyP
nnoremap <Esc>[1;4B Vyp

inoremap <Esc>J <c-o>Vy<c-o>P
inoremap <Esc>[1;4A <c-o>Vy<c-o>P
inoremap <Esc>K <c-o>Vy<c-o>p
inoremap <Esc>[1;4B <c-o>Vy<c-o>p

