set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'alvan/vim-closetag'
Plugin 'bling/vim-airline'
Plugin 'cespare/vim-toml'
Plugin 'chr4/nginx.vim'
Plugin 'christianrondeau/vim-base64'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'equalsraf/neovim-gui-shim'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'gioele/vim-autoswap'
Plugin 'honza/vim-snippets'
Plugin 'iamcco/go-to-file.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'lyokha/vim-xkbswitch'
Plugin 'mbbill/undotree'
Plugin 'morhetz/gruvbox'
Plugin 'rking/ag.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'rstacruz/vim-hyperstyle'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ternjs/tern_for_vim'
Plugin 'tomlion/vim-solidity'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'udalov/kotlin-vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'wavded/vim-stylus'
Plugin 'wincent/command-t'
call vundle#end()            " required
let NERDTreeShowHidden=1
runtime ftplugin/man.vim
set autoindent              " copy indent from previous line
syntax enable
set backspace=indent,eol,start " backspace over everything in insert mode
set cursorline
set expandtab               " tab with spaces
set exrc
set lazyredraw
set termguicolors
set ignorecase
set list
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~
set mouse=a
set number
set path+=$PWD/node_modules
set rtp+=~/go/bin
set shiftround              " drop unused spaces
set shiftwidth=4            " number of spaces to use for each step of indent
set smartcase
set smartindent             " enable nice indent
set smarttab                " indent using shiftwidth"
set softtabstop=4           " tab like 4 spaces
set suffixesadd=.js,.ts,.jsx
set colorcolumn=80
set tabstop=4
set iminsert=0
set imsearch=0
set background=dark
set clipboard=unnamed
set hlsearch
set secure
colorscheme gruvbox
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
filetype plugin indent on    " required
" let g:go_def_mode = 'godef'
" let g:go_build_tags= ['unix']
" let g:go_auto_type_info = 1



let g:rustfmt_autosave = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:NERDTreeDirArrows = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['.DS_Store','\.swp$','.git$']
let g:NERDTreeStatusline = "%{ getcwd() }"
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='papercolor'
let g:ale_fix_on_save = 1
let g:ale_javascript_eslint_use_global = 0
let g:ale_lint_on_enter = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_fixers = {
\  'javascript': ['eslint']
\}
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'go': ['gometalinter', 'gofmt']
\}
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ternServerTimeout=5
let g:ycm_semantic_triggers = {
    \   'css,less,stylus': [ 're!^\s{2}', 're!:\s+' ],
    \ }
let g:tern_show_argument_hints='on_hold'
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
let g:airline#extensions#ale#enabled = 1
let g:ctrlp_match_func = { 'match': 'GoodMatch' }
let g:path_to_matcher = '/usr/local/bin/matcher'
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" FUNCTIONS=====================================================================
function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
  let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
  if !( filereadable(cachefile) && a:items == readfile(cachefile) )
    call writefile(a:items, cachefile)
  endif
  if !filereadable(cachefile)
    return []
  endif

  let cmd = g:path_to_matcher.' --manifest '.cachefile.' '.a:str

  return split(system(cmd), "\n")
endfunction

function! SetStylOptions()
  set syntax=stylus
  set filetype=stylus
  set omnifunc=csscomplete#CompleteCSS
endfunction

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

"HIGLIGHT=======================================================================
hi AleErrorSign cterm=none ctermfg=160 ctermbg=0
hi AleWarningSign cterm=none ctermfg=220 ctermbg=0
hi GitGutterAdd cterm=none ctermbg=2
hi GitGutterChange cterm=none ctermbg=4
hi GitGutterChangeDelete cterm=none ctermbg=4
hi GitGutterDelete cterm=none ctermfg=160 ctermbg=0
hi Cursor guifg=NONE guibg=Green
hi ColorColumn ctermbg=9
"KEYMAPPINGS====================================================================
nnoremap <leader>a :Ag<space>
nnoremap <leader>ev :e ~/.vim/.vimrc<CR>
nnoremap <space>f :NERDTreeFind<CR>
nnoremap <space>j :call GotoJump()<CR>
nnoremap <space>n :noh<CR>
nnoremap fu :Ag <cword> <CR>
noremap <leader>u :call GoToURL()<CR>
noremap <space>d :NERDTreeToggle<CR>
noremap edl :call setline('.', getline('.') . ' // eslint-disable-line')<CR>
xnoremap p pgvy
"AUTOCOMMANDS===================================================================
command! W w
augroup configgroup
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufRead .babelrc set filetype=json
    autocmd BufRead .eslintrc set filetype=json
    autocmd FileType javascript noremap <buffer> gd :TernDef<CR>
    autocmd BufRead .tslintrc set filetype=json
    autocmd BufEnter *.jade set syntax=pug
    autocmd BufEnter *.sol set syntax=solidity
    autocmd BufEnter *.styl call SetStylOptions()
    autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
    autocmd VimEnter * wincmd p
    autocmd bufwritepost .vimrc source $MYVIMRC
augroup END
