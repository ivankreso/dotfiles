" this can be used to separate config for gvim and vim console
if has("gui_running")
   " only gvim settings
   " hide gvim shitbars
   "set guioptions+=a
   "set guioptions+=c
   set guioptions-=e
   set guioptions-=m  "remove menu bar
   set guioptions-=T  "remove toolbar
   set guioptions-=r  "remove right-hand scroll bar
   set guioptions-=l
   set guioptions-=L
   " Maximize gvim window.
   set lines=58 columns=160
   " set font for gvim
   set guifont=Inconsolata\ Medium\ 10
   "set guifont=mplus\ Medium\ 6
endif

" set utf-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" set <leader> to , (default is \)
let mapleader = ","
"let maplocalleader = ","

"au BufNewFile,BufRead *.cpp set syntax=cpp11

" Vundle plugin manager
set nocompatible               " be iMproved
syntax enable
filetype on
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
" Plugins to install/update with :BundleInstall/BundleUpdate
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'

"Bundle 'fholgado/minibufexpl.vim'
"Bundle 'tpope/vim-commentary'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'klen/python-mode'  - lose
"Bundle 'Lokaltog/TagHighlight'
"Bundle 'xolox/vim-easytags'
" others: vim-cpp (aur), pathogen

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

let g:solarized_contrast = "high"
let g:solarized_visibility = "high"
" Favorite colorscheme
" ironman, desert, inkpot, neon, wombat256, zenburn, molokai

"set background=dark
colorscheme solarized

"colorscheme molokai
"colorscheme darkerdesert

" Who doesn't like autoindent? - we dont need this any more
" set autoindent
" use intelligent indentation for C - this is deprecated if favor of cindent
" set smartindent
" but disable it for python
" au! FileType python setl nosmartindent

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
"set list                                                     " show trailing whitespace
"set listchars=tab:▸\ ,trail:▫

"set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

set hlsearch                                                 " highlight search
nmap <leader>hl :let @/ = ""<CR>

" Enable mouse support in console
set mouse=a

" tab options
"set shiftwidth=2
"set tabstop=2
"set softtabstop=2
"set expandtab
"set smarttab - not needed
"map <ScrollWheelUp> <C-Y><C-Y>
"map <ScrollWheelDown> <C-E><C-E>
"map <ScrollWheelUp> <C-U>
"map <ScrollWheelDown> <C-D>

" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
"set textwidth=150
set colorcolumn=115
" highlight matching braces
set showmatch
" intelligent comments
"set comments=sl:/*,mb:\ *,elx:\ */

if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" keyboard shortcuts
"let mapleader = ','
map <leader>l :Align
nmap <leader>a :Ack<space>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" TODO enable this
"nmap <leader>bd :bp | sp | bn | bd

" clear the whitespaces
nmap <leader>cw :%s/\s\+$//<CR>

" in case you forgot to sudo
cmap w!! %!sudo tee > /dev/null %

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
"let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
"if executable('ag')
"  let g:ackprg = 'ag --nogroup --column'
"
"  " Use Ag over Grep
"  set grepprg=ag\ --nogroup\ --nocolor
"
"  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" ================ Turn Off Swap Files ==============
"set noswapfile
"set nobackup
"set nowb

" disable autocomments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"set formatoptions-=cro

" ----------Key shortcuts-----------
" NERDtree toggle - no recursive map needed
noremap <C-b> :NERDTreeToggle<CR>
"noremap <F8> :TagbarToggle<CR>

"noremap <C-t> :TlistToggle<CR>
"noremap <C-y> :TagbarToggle<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" unlock Ctrl+j from bash so we can map it to move cursor in insert mode
" not working anymore :(
"let g:BASH_Ctrl_j = 'off'
"let g:C_Ctrl_j = 'off'
" Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"" Easy cursor navigation in insert mode
"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>

" disable arrows for better learning curve
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" rest is plugin options:

" TagBar
"let g:tagbar_autoshowtag = 1
"let g:tagbar_left = 1
"let g:tagbar_sort = 1
"let g:tagbar_autofocus = 1

" minibufexpl options
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"let g:miniBufExplForceSyntaxEnable = 0 
"let g:miniBufExplSplitBelow = 0
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMaxSize = 0
"let g:miniBufExplTabWrap = 1
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplCheckDupeBufs = 0

" show hidden files in nerdtree
let NERDTreeShowHidden=1

" Syntastic options
let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_include_dirs = ['../include','include']
let g:syntastic_cpp_include_dirs = ['/usr/include/pcl-1.7/']
"let g:syntastic_cpp_checker = ['ycm']
"let g:syntastic_cpp_compiler_options = ' -std=c++11'

" youcompleteme options
set completeopt=menu
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '/home/kivan/Dropbox/src/cpp/.ycm_extra_conf.py'
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_autoclose_preview_window_after_completion = 0
"let g:ycm_autoclose_preview_window_after_insertion = 0
"let g:ycm_register_as_syntastic_checker = 0
"set updatetime=4000
"let g:ycm_allow_changing_updatetime = 0

"set tags=./tags;/
"set tags+=~/.vim/tags/cpp
"set tags+=/usr/include/opencv2/opencv_tags
" example tags:
"set tags=~/.vim/tags/cpp,tags,.tags,../tags,/usr/include/opencv2/opencv_tags
"set tags+=tags,/usr/include/opencv2/opencv_tags
" Load standard tag files
"set tags+=~/.vim/tags/cpp

"au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

"Set the following lines in your ~/.vimrc or the systemwide /etc/vimrc:
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

