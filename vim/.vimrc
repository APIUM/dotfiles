"""
" ViM Config "
"""
""""""""""""""""""""""""
" PLUG AND ETC STUFF "
""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
call plug#begin()
 
" Utilities
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'embear/vim-localvimrc' " Allows you to have a per file vimrc

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI for LSP
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1 

" neosnippet
Plug 'roxma/nvim-yarp'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" LSP 

" Clang completion
" Plug 'Shougo/vimproc.vim' " required for vim-marching
" Python Completion
" Plug 'davidhalter/jedi-vim'

" LSP
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""
" LSP
""""""""""""""""""""""""

let g:LanguageClient_serverCommands = {
			\ 'cpp': ['cquery', 
			\ '--log-file=/tmp/cq.log', 
			\ '--init={"cacheDirectory":"/home/apium/var/cquery/"}']                                                                                                                                                                              
			\ }
" Use an absolute configuration path if you want system-wide settings
" let g:LanguageClient_settingsPath = '/home/apium/.config/vim/settings.json'"

"""""""""""
" Mapping "
"""""""""""
set pyxversion=3 " for vim-hug-neovi

" cquery neosnippet config
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

map <C-\> :NERDTreeToggle<CR>

""""""""""""""""
" Basic Config "
""""""""""""""""

" Deoplete Options
" Enable deoplete
let g:deoplete#enable_at_startup = 1
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

" Compile and run c & c++ code
map <F5> :w <CR> :!g++ % -o %< && ./%< <CR>

" local vimrc
let g:localvimrc_persistent = 1 " when asked about config loads, capitals are persistant
let g:localvimrc_sandbox = 0 " don't load in sandbox


""""""""""
" TO ADD " *maybe
""""""""""

" supertab
