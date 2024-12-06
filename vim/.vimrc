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

" Golang Enable Autocomplete 
let g:go_auto_type_info = 1
let g:go_code_completion_enabled = 1

" Golang Syntax Highlight 
let g:go_fmt_command = "gopls"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1

" Enable Go Imports
let g:go_metalinter_command = "golangci-lint run --out-format=line-number"

let g:go_echo_command_info = 0
let g:go_def_mapping_enabled = 1
let g:go_jump_to_error = 0

" Coc.nvim Autocompletion Global Extension 
let g:coc_global_extensions = ['coc-go']

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

" Coc.nvim 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" }}}


" MAPPINGS --------------------------------------------------------------- {{{
" Remapping <leader> to Space
let mapleader = " "

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

" Golang Remappings
" Run tests for the current package
nnoremap <leader>tp :GoTest<CR>

" Run tests for the function under the cursor
nnoremap <leader>tf :GoTestFunc<CR>

" Format the current file
nnoremap <leader>gf :GoFmt<CR>

" Run Go linting
nnoremap <leader>gl :GoLint<CR>

" Display documentation for the symbol under the cursor
nnoremap <leader>gd :GoDoc<CR>

" Go to the definition of the symbol under the cursor
nnoremap <leader>gD :GoDef<CR>

" Rename a symbol using LSP (requires gopls)
nnoremap <leader>gr :GoRename<CR>

" Add or remove imports (organize imports)
nnoremap <leader>gi :GoImports<CR>

" Show the type of the symbol under the cursor
nnoremap <leader>gt :GoInfo<CR>

" Run benchmarks
nnoremap <leader>gb :GoBench<CR>

nnoremap <C-h> <C-w>h " Move to the left window
nnoremap <C-j> <C-w>j " Move to the window below
nnoremap <C-k> <C-w>k " Move to the window above
nnoremap <C-l> <C-w>l " Move to the right window

" Jump to the next error or warning
nnoremap <leader>en :cnext<CR>
nnoremap <leader>ep :cprev<CR>

" Toggle between last two files
nnoremap <leader><Tab> :e#<CR>

" Save the file
nnoremap <leader>w :w<CR>

" Quit Vim
nnoremap <leader>q :q<CR>

" Save and quit
nnoremap <leader>wq :wq<CR>

" Navigate buffers
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Close the current buffer
nnoremap <leader>bd :bdelete<CR>

" List all buffers
nnoremap <leader>bl :ls<CR>:b<Space>

" Git status
nnoremap <leader>gs :Git<CR>

" Git commit
nnoremap <leader>gc :Git commit<CR>

" Git push
nnoremap <leader>gp :Git push<CR>

" Git pull
nnoremap <leader>gP :Git pull<CR>

" Clear search highlight
nnoremap <leader>sc :noh<CR>

" Incremental search with better visuals
nnoremap <leader>si :set hlsearch!<CR>

" Open a horizontal split and prompt for a file
nnoremap <leader>sh :split <C-R>=expand("%:p:h") . "/"<CR>

" Open a vertical split and prompt for a file
nnoremap <leader>sv :vsplit <C-R>=expand("%:p:h") . "/"<CR>

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

