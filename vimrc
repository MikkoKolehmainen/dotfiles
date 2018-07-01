" configure Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlp.vim'
Plugin 'tComment'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rking/ag.vim'
Plugin 'Lokaltog/powerline'
" Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
" Plugin 'bronson/vim-trailing-whitespace'
" Plugin 'ervandew/supertab'
" Plugin 'tristen/vim-sparkup'
" Plugin 'w0rp/ale'
" Plugin 'ZoomWin'

call vundle#end()

" initial settings

set encoding=utf-8
set nocompatible
syntax enable
colorscheme badwolf

set tabstop=4 " space per TAB
set softtabstop=2 " spaces in TAB when editing
set expandtab " tabs are spaces

set number " show line numbers
set ruler " show where you are
set showcmd " shot command in bottom bar

set cursorline " highlight current line

set autoindent

set clipboard=unnamed "y and p with system clipboard
set wildmenu " visual autocomplete for command menu

set lazyredraw " redraw only when needed

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" enable basic mouse behavior 
set mouse=a
if exists('TMUX')
        set ttymouse=xterm2
endif

" Searching

set incsearch
set hlsearch
set ignorecase


" Folding

" set foldenable
" set foldlevelstart=10
" set foldnestmax=10
" set foldmethod=indent

" Movement

" enforce purity
noremap  <Up> <Nop>
noremap  <Down> <Nop>
noremap  <Left> <Nop>
noremap  <Right> <Nop>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

let mapleader=","

" Leader shortcuts

nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>a :Ag
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
