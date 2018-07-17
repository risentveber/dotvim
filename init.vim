set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/.vimrc
set termguicolors
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>
endif

highlight TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
let g:tern_request_timeout = 5
