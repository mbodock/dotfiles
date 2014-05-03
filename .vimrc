" Set bash as default shell in vim
" Needed if you uses fish as dafult shell
set shell=bash

" Loads pathogen
execute pathogen#infect()
 
" Collors and Themes
syntax on
filetype plugin indent on
syntax enable
set t_Co=256
colorscheme koehler

" Uses tab and shift+tab to change tabs
map <Tab> :tabnext<cr>
map <S-Tab> :tabprevious<cr>

" Show numbers on vim
set number
 
" Misc
set directory=/tmp
set exrc
set secure
set expandtab
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
map 0 ^
set splitright
set splitbelow
set laststatus=2
set background=dark

set noshowmode

" bodocks =D
nmap <leader>o :NERDTreeToggle<cr>
nmap <F3> :noh<cr>

" Vim-airline configs
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" Removendo lag ao sair do modo de inserção
set ttimeoutlen=50
