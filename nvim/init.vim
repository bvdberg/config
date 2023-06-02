set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set smartindent
set nowrap
set smarttab
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set nonumber                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=100                  " set an 80 column border for good coding style
set history=1000
set nobackup
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
"set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
"vnoremap . :normal .<CR>
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


call plug#begin()
"Plug 'neovim/nvim-lspconfig'
"Plug 'SirVer/ultisnips'
"Plug 'Yohannfra/Vim-Goto-Header'
Plug 'nvim-lua/plenary.nvim' " required dependency for Ouroboros
Plug 'jakemason/ouroboros'
Plug 'c2lang/c2.vim'
Plug 'honza/vim-snippets'
call plug#end()



" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv" move split panes to left/bottom/top/right
 nnoremap <A-h> <C-W>H
 nnoremap <A-j> <C-W>J
 nnoremap <A-k> <C-W>K
 nnoremap <A-l> <C-W>L" move between panes to left/bottom/top/right
 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l

map <silent> <F3> :Rg <CR> :copen <CR>
map <silent> <F4> :cn <CR>
map <silent> <F5> :ccl <CR>
map <silent> <F6> :make -C build -j16<CR><CR><CR> :copen<CR>
map <silent> <F7> :make --fast<CR><CR><CR> :copen <CR>
map <silent> <F8> :make --check<CR><CR><CR> :copen <CR>
map <silent> <F9> :make src<CR><CR><CR> :copen <CR>
map <silent> <F10> :!ctags -R --languages=C,C++<CR><C
map <silent> <F10> :!ctags -R --languages=C,C++<CR><CR>
map <silent> <F12> : qa!<CR>

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

" Ouroboros allows switching between C/Cpp and header file with Ctrl-h
autocmd! Filetype c,cpp map<buffer> <C-h> :Ouroboros<CR>
autocmd! Filetype c2 map<buffer> <C-h> :C2TagDef<CR>

cnoreabbrev c2t C2SymbolDef

" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

