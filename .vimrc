set encoding=utf-8

let g:vim_dir = has("nvim") ? expand('~/.config/nvim') : expand('~/.vim')
let s:cache_home = vim_dir . '/.cache'
let s:dein_dir = expand('~/.config/dein')
let s:dein_repo_dir = expand('~/src/github.com/Shougo/dein.vim')
let g:ruby_default_path = expand('~/.rbenv/versions/2.4.0/bin/ruby')
let g:python_host_prog = expand('~/.pyenv/versions/miniconda3-latest/envs/python2-latest/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/miniconda3-latest/envs/python3-latest/bin/python')

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  let s:dein = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
  let s:dein_lazy = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:dein, {'lazy': 0})
  call dein#load_toml(s:dein_lazy, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
set clipboard+=unnamedplus

" highlight
syntax enable
colorscheme darcula
set showmatch
set matchtime=3
set cursorline

" encoding
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

" statusline
set laststatus=2
set showmode
set showcmd
set ruler
set wildmenu
set history=5000
let g:lightline = {
                  \ 'colorscheme': 'wombat',
                  \ 'component': {
                  \   'readonly': '%{&readonly?"🔒":""}',
                  \ },
                  \ 'separator': { 'left': '', 'right': '' },
                  \ 'subseparator': { 'left': '', 'right': '' },
                  \ }

" indent
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2

" search
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" cursor
set whichwrap=b,s,h,l,<,>,[,],~
set number

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set backspace=indent,eol,start
" unlimited undo
if has('persistent_undo')
  set undodir=~/.config/nvim/undo
  set undofile
endif

if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
endif



""""""""""""
" plugins
""""""""""""

" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_ruby_checkers=['rubocop']

" ctrlp
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100'
let g:ctrlp_show_hidden = 1
let g:ctrlp_types = ['fil']
let g:ctrlp_extensions = ['funky', 'commandline']
command! CtrlPCommandLine call ctrlp#init(ctrlp#commandline#id())
let g:ctrlp_funky_matchtype = 'path'

if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --hidden -g ""'
endif

