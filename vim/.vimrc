set nocompatible

filetype on

filetype plugin on

filetype indent on 

syntax on

set number

set autoread

set autoindent

set cursorline 

set cursorcolumn

set shiftwidth=4 

set tabstop=4

set expandtab

set nobackup

set scrolloff=10

set nowrap 

set incsearch

set ignorecase 

set smartcase 

set showcmd

set showmode 

set showmatch 

set hlsearch 

set history=1000

set wildmenu

set backspace=indent,eol,start

set wildmode=list:longest

set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin()

" Golang LSP: vim-go
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }

" Nerdtree
Plug 'preservim/nerdtree'

" Vim-Airline
Plug 'vim-airline/vim-airline'

" Vim-fugitive
Plug 'tpope/vim-fugitive'

call plug#end()
" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Insert ESC remap 
inoremap jk <Esc>

" Nerd Tree Mappings 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree. If a file is specified, move the cursor to its window. 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
