" UTF-8 NWA style
set encoding=utf-8
scriptencoding utf-8

filetype plugin indent on

syntax enable

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set clipboard=unnamed
set clipboard+=unnamedplus
" set <leader> to , (default is \)
let mapleader = ","
map <Space> <Leader>
map <Space><Space> <Leader><Leader>
"let mapleader = " "
"let mapleader="\<space>"
"let maplocalleader = ","

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
"nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><Leader> V
nmap ` <NOP>

if has('nvim')
  nmap <BS> <C-W>h
endif
" Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal mode mappings
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l


" disable arrows for better learning curve
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <left> <nop>
imap <right> <nop>


" {{{ Options
set laststatus=2
set number norelativenumber numberwidth=1
set synmaxcol=100
set path=.,/usr/local/include,/usr/include,$HOME/.local/include
set novisualbell
set errorbells
set ruler
set conceallevel=2 concealcursor=nv
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set textwidth=90
set nowrap
call matchadd('ColorColumn', '\%' . &textwidth . 'v', 90)

set complete=k,.,w,b,u,U,i,d,t
set completeopt=menu,longest
set nocursorline nocursorcolumn

set showmatch wrapscan
set nogdefault noignorecase
set showcmd
set showfulltag
set showmatch
set modeline modelines=5
set noshelltemp
"set showtabline=2
set backspace=indent,eol,start

set wildmenu wildmode=longest:full
set wildoptions=tagfile
set wildignorecase

set matchtime=3
set maxcombine=2

" Ignore a lot of stuff.
set wildignore+=*.swp,*.pyc,*.bak,*.class,*.orig
set wildignore+=.git,.hg,.bzr,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg
set wildignore+=build/*,tmp/*,vendor/cache/*,bin/*
set wildignore+=.sass-cache/*,*node_modules/*,*/target/*

set nobackup noswapfile
set undofile undodir=~/.config/nvim/undodir

set cpoptions+=d

set foldmethod=manual
set nofoldenable
set foldcolumn=1
set foldlevel=1
set foldminlines=3
set foldnestmax=5
set foldlevelstart=1

set spelllang=en_us
set spellsuggest=best,6
set dictionary+=/usr/share/dict/words,
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/web2,
set dictionary+=/usr/share/dict/propernames.gz
set dictionary+=/usr/share/dict/connectives.gz
set dictionary+=/usr/share/dict/web2a.gz
set spellfile=~/.config/nvim/dict.custom.utf-8.add

set splitbelow splitright

set cinoptions+='JN'

if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif
" }}}

" {{{2 White spacing and Characters
" A problem that plagued me for months, having visual cues for white spacing
" solves formatting problems a lot quicker. Also, we're using modern shells
" (right?) so using UTF-8 characters for symbols should be a given.
set fillchars+=diff:⣿
set fillchars+=vert:│
set fillchars+=fold:-

" A visual cue for line-wrapping.
set showbreak=↪

" Visual cues when in 'list' model.
set nolist
set listchars+=eol:¬
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=trail:⋅
set listchars+=nbsp:⋅
set listchars+=tab:\|\ 

" Keep some spacing.
set sidescrolloff=1
"}}}



call g:plug#begin('~/.config/nvim/plugins')

" check: https://github.com/jalcine/vimrc/blob/master/home/.config/nvim/init.vim
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'gosukiwi/vim-atom-dark'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'benekastah/neomake', { 'on': 'Neomake' }
Plug 'KabbAmine/zeavim.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'klen/python-mode'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
"Plug 'tpope/vim-surround'

call g:plug#end()

set background=dark
colorscheme jellybeans
"colorscheme gruvbox

augroup kivan
  au!
  au FileType python setl sw=2 sts=2 et

  " Enable Neomake to run on builds.
  au BufWritePost * Neomake
  au BufReadPost  * Neomake
augroup END

" keyboard shortcuts
map <leader>l :Align
"nmap <leader>a :Ack<space>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>p :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
"nmap <leader>g :GitGutterToggle<CR>
"nmap <leader>c <Plug>Kwbd
"map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


let g:neomake_list_height = 3
let g:neomake_open_list = 0
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
let g:neomake_verbose = 1
let g:neomake_javascript_enabled_checkers = ['eslint']
"let g:neomake_python_enabled_checkers = ['python', 'flake8']
let g:neomake_python_enabled_checkers = ['pylint']
let g:neomake_scss_enabled_checkers = ['scss-lint']
let g:neomake_sh_enabled_checkers = ['shellcheck']
let g:neomake_ruby_enabled_checkers = ['rubocop', 'mri']
let g:neomake_vim_enabled_checkers = ['vint']
let g:neomake_elixir_enabled_checkers = ['mix', 'credo']

let g:pymode_lint = 0
let g:pymode_breakpoint = 0
