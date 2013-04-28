if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Vundle plugin manager
set nocompatible               " be iMproved
filetype off                   " required!

" set <leader> to , (default is \)
let mapleader = ","
set tags=tags;/

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Plugins..
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
" others: vim-cpp (aur)

filetype plugin indent on     " required!

" Needed for Syntax Highlighting and stuff
"filetype on
"filetype plugin on
syntax enable
set background=dark
" Favorite colorscheme
" ironman, desert, inkpot, neon, wombat256, zenburn, molokai
colorscheme molokai

" Who doesn't like autoindent?
set autoindent

" Who wants an 8 character tab?  Not me!
set shiftwidth=4
set softtabstop=4

" Enable mouse support in console
set mouse=a
" Line Numbers PWN!
set number


" ----------Key shortcuts-----------
" NERDtree toggle - no recursive map needed
noremap <C-b> :NERDTreeToggle<CR>
noremap <C-t> :TlistToggle<CR>
noremap <C-y> :TagbarToggle<CR>

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;


" minibufexpl options
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


" youcompleteme options
set completeopt=menu
let g:ycm_confirm_extra_conf = 0
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_autoclose_preview_window_after_completion = 0
"let g:ycm_autoclose_preview_window_after_insertion = 0
"let g:ycm_register_as_syntastic_checker = 0

" Syntastic options
"let g:syntastic_cpp_checker = "ycm"
"let g:syntastic_cpp_compiler_options = ' -std=c++11'

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Got backspace?
"set backspace=2

" Spaces are better than a tab character - no they aren't
"set expandtab
"set smarttab

" Real men use gcc
"compiler gcc

" Use english for spellchecking, but don't spellcheck by default
"if version >= 700
"   set spl=en spell
"   set nospell
"endif

