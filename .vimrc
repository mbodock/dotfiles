" Set bash as default shell in vim
" Needed if you uses fish as dafult shell
set shell=bash

" Loads pathogen
execute pathogen#infect()
 
" Collors and Themes
syntax on
filetype plugin indent on
syntax enable

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
set t_Co=256
set laststatus=2
set background=dark
colorscheme solarized
set noshowmode

" Powerline initialize
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
colorscheme solarized

" bodocks =D
nmap <leader>o :NERDTreeToggle<cr>

