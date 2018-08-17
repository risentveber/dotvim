"PLUGINS========================================================================
call plug#begin('~/.vim/bundle')
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'alvan/vim-closetag'
Plug 'bling/vim-airline'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chr4/nginx.vim', { 'for': 'nginx' }
Plug 'christianrondeau/vim-base64'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'equalsraf/neovim-gui-shim'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'gioele/vim-autoswap'
Plug 'honza/vim-snippets'
Plug 'iamcco/go-to-file.vim'
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }
Plug 'lyokha/vim-xkbswitch'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'rking/ag.vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'rstacruz/vim-hyperstyle'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ternjs/tern_for_vim'
Plug 'tomlion/vim-solidity', { 'for': 'solidity' }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'wincent/command-t'
call plug#end()

"OPTIONS========================================================================
colorscheme gruvbox
filetype plugin indent on    " required
let NERDTreeShowHidden=1
runtime ftplugin/man.vim
set autoindent              " copy indent from previous line
set background=dark
set backspace=indent,eol,start " backspace over everything in insert mode
set clipboard=unnamed
set colorcolumn=80
set cursorline
set expandtab               " tab with spaces
set exrc
set foldlevelstart=2
set hlsearch
set ignorecase
set iminsert=0
set imsearch=0
set lazyredraw
set list
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~
set mouse=a
set number
set path+=$PWD/node_modules
set rtp+=~/go/bin
set secure
set shiftround              " drop unused spaces
set shiftwidth=4            " number of spaces to use for each step of indent
set smartcase
set smartindent             " enable nice indent
set smarttab                " indent using shiftwidth"
set softtabstop=4           " tab like 4 spaces
set suffixesadd=.js,.ts,.jsx
set tabstop=4
set termguicolors
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
syntax enable

"GLOBALS========================================================================
let g:rustfmt_autosave = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeIgnore = ['.DS_Store','\.swp$','.git$']
let g:NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = 'NERD'
" let g:NERDTreeStatusline = '%{ getcwd() }'
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
let g:airline#extensions#ale#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='papercolor'
let g:ale_fix_on_save = 1
let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_javascript_eslint_use_global = 0
let g:ale_lint_on_enter = 1
let g:ale_linters = { 'javascript': ['eslint'], 'go': ['gometalinter', 'gofmt'] }
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ag_working_path_mode = 'r'
let g:ctrlp_match_func = { 'match': 'CustomMatch' }
let g:path_to_matcher = '/usr/local/bin/matcher'
let g:tern_request_timeout = 5
let g:tern_show_argument_hints='on_hold'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_semantic_triggers = { 'css,less,stylus': [ 're!^\s{2}', 're!:\s+' ] }
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -U -g ""'
  let g:ctrlp_use_caching = 0
endif

" FUNCTIONS=====================================================================
function! CustomMatch(items, str, limit, mmode, ispath, crfile, regex)
  let cachefile = ctrlp#utils#cachedir().'/matcher.cache'

  if !( filereadable(cachefile) && a:items == readfile(cachefile) )
    call writefile(a:items, cachefile)
  endif

  let cmd = g:path_to_matcher.' --manifest '.cachefile.' '.a:str

  return split(system(cmd), '\n')
endfunction

function! SetStylOptions()
  set syntax=stylus
  set filetype=stylus
  set omnifunc=csscomplete#CompleteCSS
endfunction

function! SetJSONOptions()
  set filetype=json
  set fdm=syntax
endfunction

function! GotoJump()
  jumps
  let j = input('Please select your jump: ')
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute 'normal ' . j . '\<c-i>'
    else
      execute 'normal ' . j . '\<c-o>'
    endif
  endif
endfunction

function! GoToURL()
  let s:uri = matchstr(getline('.'), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ''
    silent exec '!open -a "Google Chrome" "'.s:uri.'"'
  else
    echo 'No URI found in line.'
  endif
endfunction

function! CustomizeYCM(key, val)
    if type(a:val) == v:t_string
        return a:val
    endif
    let a:val.word = substitute(a:val.word, '.js\(x\)\?$',"","")
    return a:val
endfunction
" Need for completion customization
" let response = s:Pyeval( 'ycm_state.GetCompletionResponse()' )
" let s:completion = {
"       \   'start_column': response.completion_start_column,
"       \   'candidates': map(response.completions, function('CustomizeYCM'))
"       \ }
" call s:Complete()

"HIGLIGHT=======================================================================
hi AleErrorSign cterm=none ctermfg=160 ctermbg=0
hi AleWarningSign cterm=none ctermfg=220 ctermbg=0
hi GitGutterAdd cterm=none ctermbg=2
hi GitGutterChange cterm=none ctermbg=4
hi GitGutterChangeDelete cterm=none ctermbg=4
hi GitGutterDelete cterm=none ctermfg=160 ctermbg=0
hi Cursor guifg=NONE guibg=Green
hi ColorColumn ctermbg=9
hi TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15

"KEYMAPPINGS====================================================================
nnoremap <leader>a :Ag<space>
nnoremap <leader>ev :e ~/.vim/.vimrc<CR>
nnoremap <space>f :NERDTreeFind<CR>
nnoremap <space>j :call GotoJump()<CR>
nnoremap <space>n :noh<CR>
nnoremap fu :Ag <cword> <CR>
noremap <leader>u :call GoToURL()<CR>
nnoremap <space><space> za
nnoremap gr :GoReferrers<CR>
noremap <space>d :NERDTreeToggle<CR>
noremap <leader>e :ALENext<cr>
noremap <leader>cf :let @+ = expand("%")<cr>
noremap edl :call setline('.', getline('.') . ' // eslint-disable-line')<CR>
xnoremap p pgvy
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>
endif

"COMMANDS=======================================================================
command! W w
command! Q q
command! FJ %!jq '.'

"AUTOCOMMANDS===================================================================
augroup configgroup
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter .babelrc,.eslintrc,*.json call SetJSONOptions()
    autocmd FileType javascript noremap <buffer> gd :TernDef<CR>
    autocmd BufRead .tslintrc set filetype=json
    autocmd BufEnter *.jade set syntax=pug
    autocmd BufEnter *.sol set syntax=solidity
    autocmd BufEnter *.styl call SetStylOptions()
    autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
    autocmd VimEnter * wincmd p
    autocmd bufwritepost .vimrc source $MYVIMRC
augroup END
