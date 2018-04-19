"""
" ViM Config "
"""
""""""""""""""""""""""""
" VUNDLE AND ETC STUFF "
""""""""""""""""""""""""

" Disable file type for vindle
filetype off
" set the runtime path to include V
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
 
" Utilities
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'lervag/vimtex'
Plugin 'w0rp/ale'

" Clang completion
Plugin 'Shougo/vim-marching'
Plugin 'Shougo/vimproc.vim' " required for vim-marching
" Python Completion
Plugin 'davidhalter/jedi-vim'


" Writing
Plugin 'godlygeek/tabular' " required for vim-markdown
Plugin 'vim-markdown'

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""
" Mapping "
"""""""""""

map <C-n> :NERDTreeToggle<CR>

""""""""""""""""
" Basic Config "
""""""""""""""""

" Neocomplete Options
" Enable Neocomplete
let g:neocomplete#enable_at_startup = 1
" Enable vim-marching
let g:marching_enable_neocomplete = 1
" Enable VimTex
let g:airline#extensions#vimtex#enabled = 1

" State indicators for VimTex

let g:airline#extensions#vimtex#main = ""

" the current tex file is a subfile of the project
" and the compilation is set for the main file
let g:airline#extensions#vimtex#sub_main = "m"

"the current tex file is a subfile of the project
"and the compilation is set for this subfile
let g:airline#extensions#vimtex#sub_local = "l"

"single compilation is running
let g:airline#extensions#vimtex#compiled = "c₁"

" continuousr compilation is running
let g:airline#extensions#vimtex#continuous = "c"

"viewer is opened
let g:airline#extensions#vimtex#viewer = "v"



" Enable syntax
syntax enable
set number
" set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set clipboard=unnamedplus

" Show position 
set ruler

" Be smart about searching
set smartcase

" Highlight search result
set hlsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Indenting
set si "Smart indent
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" REMOVE BEEEPS!!!
:set vb t_vb=

""""""""""
" TO ADD " *maybe
""""""""""

" supertab
