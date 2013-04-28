"set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=l
set guioptions-=L

" set utf-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" set font for gvim
set guifont=Inconsolata\ Medium\ 11

" Vundle plugin manager
set nocompatible               " be iMproved
filetype off                   " required!

" set <leader> to , (default is \)
"let mapleader = ","
"set tags=tags;/
"set tags=~/.vim/stdtags,tags,.tags,../tags
set tags+=tags,/usr/include/opencv2/opencv_tags
" Load standard tag files
"set tags+=~/.vim/tags/cpp

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"call vundle#ActivateAddons(['powerline'])

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Plugins..
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'altercation/solarized'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'Lokaltog/TagHighlight'
"Bundle 'xolox/vim-easytags'
"Bundle 'vim-colors-solarized'
"Bundle 'tpope/vim-pathogen'
" others: vim-cpp (aur)

filetype plugin indent on     " required!

" Needed for Syntax Highlighting and stuff
"filetype on
"filetype plugin on
syntax enable

" Favorite colorscheme
" ironman, desert, inkpot, neon, wombat256, zenburn, molokai
colorscheme molokai
set background=dark

" Who doesn't like autoindent?
set autoindent
" use intelligent indentation for C
set smartindent

" Who wants an 8 character tab?  Not me!
set shiftwidth=3
set softtabstop=3
" expand tabs to spaces
"set expandtab
"set smarttab
" Enable mouse support in console
set mouse=a
" Line Numbers PWN!
set number

" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */



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
"let g:miniBufExplForceSyntaxEnable = 0 
"let g:miniBufExplSplitBelow = 0
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMaxSize = 0
"let g:miniBufExplTabWrap = 1
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplCheckDupeBufs = 0

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

" Real men use gcc
"compiler gcc

" Use english for spellchecking, but don't spellcheck by default
"if version >= 700
"   set spl=en spell
"   set nospell
"endif


" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Gerhard Gappmeier <gerhard.gappmeier@ascolab.com>" 
"let g:DoxygenToolkit_licenseTag="My own license"

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" map F3 and SHIFT-F3 to toggle spell checking
nmap <F3> :setlocal spell spelllang=en<CR>
imap <F3> <ESC>:setlocal spell spelllang=en<CR>i
nmap <S-F3> :setlocal spell spelllang=<CR>
imap <S-F3> <ESC>:setlocal spell spelllang=<CR>i
" switch between header/source with F4 C++
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" switch between header/source with F4 C
map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
" recreate tags file with F5
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
nmap <F7> :make<CR>
" build using makeprg with <F7>, in insert mode exit to command mode, save and compile
imap <F7> <ESC>:w<CR>:make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" macro recording
nmap <S-F8> qq
nmap <F8> @q
" goto definition with F12
map <F12> <C-]>
" in diff mode we use the spell check keys for merging
if &diff
  " diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
"  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif

