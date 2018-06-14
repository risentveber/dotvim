set exrc
runtime ftplugin/man.vim
set number
set cursorline

set mouse=a
set ignorecase
set smartcase
autocmd BufWritePre * %s/\s\+$//e
" set the runtime path to include Vundle and initialize
set list
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~
let NERDTreeShowHidden=1
set suffixesadd=.js,.ts,.jsx
set path+=$PWD/node_modules
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/go/bin
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
set backspace=indent,eol,start " backspace over everything in insert mode
" Tab options
set autoindent              " copy indent from previous line
set smartindent             " enable nice indent
set smarttab                " indent using shiftwidth"
set expandtab               " tab with spaces
set shiftwidth=4            " number of spaces to use for each step of indent
set tabstop=4
set softtabstop=4           " tab like 4 spaces
set shiftround              " drop unused spaces
" let Vundle manage Vundle, required
Plugin 'rust-lang/rust.vim'
Plugin 'udalov/kotlin-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'VundleVim/Vundle.vim'
Plugin 'christianrondeau/vim-base64'
Plugin 'morhetz/gruvbox'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mbbill/undotree'
Plugin 'digitaltoad/vim-pug'
Plugin 'wavded/vim-stylus'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ternjs/tern_for_vim'
Plugin 'gioele/vim-autoswap'
Plugin 'rstacruz/vim-hyperstyle'
Plugin 'lyokha/vim-xkbswitch'
Plugin 'tomlion/vim-solidity'
Plugin 'fatih/vim-go'
Plugin 'cespare/vim-toml'
Plugin 'equalsraf/neovim-gui-shim'
Plugin 'chr4/nginx.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'iamcco/go-to-file.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'JamshedVesuna/vim-markdown-preview'
set iminsert=0
set imsearch=0
let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
" highlight lCursor guifg=NONE guibg=Cyan

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:airline#extensions#ale#enabled = 1
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let NERDTreeDirArrows = 1
let NERDTreeMinimalUI = 1
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'
"CtrlP
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l  -g ""'
endif
let g:path_to_matcher = "/usr/local/bin/matcher"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git'
" let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -co --exclude-standard']
let g:ctrlp_match_func = { 'match': 'GoodMatch' }

function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
  let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
  if !( filereadable(cachefile) && a:items == readfile(cachefile) )
    call writefile(a:items, cachefile)
  endif
  if !filereadable(cachefile)
    return []
  endif

  " a:mmode is currently ignored. In the future, we should probably do
  " something about that. the matcher behaves like "full-line".
  let cmd = g:path_to_matcher.' --manifest '.cachefile.' '
  " let cmd = g:path_to_matcher.' --limit '.a:limit.' --manifest '.cachefile.' '
  " if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
  "   let cmd = cmd.'--no-dotfiles '
  " endif
  let cmd = cmd.a:str

  return split(system(cmd), "\n")

endfunction
" let g:go_def_mode = 'godef'
" le g:go_build_tags= ['unix']
" let g:go_auto_type_info = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_fixers = {
\  'javascript': ['eslint']
\}
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'go': ['gometalinter', 'gofmt']
\}
" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ternServerTimeout=5
let g:ycm_semantic_triggers = {
    \   'css,less,stylus': [ 're!^\s{2}', 're!:\s+' ],
    \ }
let g:tern_show_argument_hints='on_hold'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdtree'
Plugin 'isRuslan/vim-es6'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" autocmd VimEnter * NERDTree | wincmd p
Plugin 'tpope/vim-abolish'
Plugin 'Raimondi/delimitMate'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let NERDTreeIgnore = ['.DS_Store','\.swp$','.git$']

set colorcolumn=80
autocmd BufEnter *.jade set syntax=pug
autocmd BufEnter *.sol set syntax=solidity
autocmd BufEnter *.styl  call SetMyStylOptions()
function SetMyStylOptions()
  set syntax=stylus
  set filetype=stylus
  set omnifunc=csscomplete#CompleteCSS
endfunction

highlight ColorColumn ctermbg=9

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
let g:rustfmt_autosave = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:airline_left_sep = ''
let g:airline_right_sep = ''
syntax enable
set background=dark
let NERDTreeStatusline = "%{ getcwd() }"
hi AleErrorSign cterm=none ctermfg=160 ctermbg=0
hi AleWarningSign cterm=none ctermfg=220 ctermbg=0
hi GitGutterAdd cterm=none ctermbg=2
hi GitGutterChange cterm=none ctermbg=4
hi GitGutterChangeDelete cterm=none ctermbg=4
hi GitGutterDelete cterm=none ctermfg=160 ctermbg=0
let g:ale_javascript_eslint_use_global = 0
colorscheme gruvbox
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
autocmd VimEnter * wincmd p
autocmd bufwritepost .vimrc source $MYVIMRC
let g:airline_theme='papercolor'
nnoremap <space>f :NERDTreeFind<CR>
nmap fu :Ag <cword> <CR>
nnoremap <space>n :noh<CR>
set clipboard=unnamed
set hlsearch
set secure
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction
function! GoToURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    silent exec "!open -a \"Google Chrome\" '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction
map <leader>u :call GoToURL()<CR>
nmap <space>j :call GotoJump()<CR>
map <space>d :NERDTreeToggle<CR>
xnoremap p pgvy
highlight Cursor guifg=NONE guibg=Green
set termguicolors
autocmd FileType javascript noremap <buffer> gd :TernDef<CR>
noremap edl :call setline('.', getline('.') . ' // eslint-disable-line')<CR>

autocmd BufRead .babelrc set filetype=json
autocmd BufRead .eslintrc set filetype=json
autocmd BufRead .tslintrc set filetype=json
