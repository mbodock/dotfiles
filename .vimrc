" Required by Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Set bash as default shell in vim
" Needed if you uses fish as dafult shell
set shell=bash

"Plugin list to Vundle


" Loads pathogen
execute pathogen#infect()

" Collors and Themes
syntax on
filetype plugin indent on
syntax enable
set t_Co=256
colorscheme solarized
let g:solarized_termcolors=256

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
set mouse=a     " Enable mouse usage (all modes)
set noshowmode

" bodocks =D
nmap <leader>o :NERDTreeToggle<cr>
nmap <F3> :noh<cr>
nmap <leader>k ddkkp
nmap <leader>j ddp

"Jedi-Vim
let g:jedi#popup_select_first = 0


" Vim-airline configs
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Removendo lag ao sair do modo de inserção
set ttimeoutlen=50

" Vim-Flake8
let g:flake8_max_line_length=99

" Make things hard
noremap <Up>    :echo "YOU NOOB!"<cr>
noremap <Down>  :echo "YOU NOOB!"<cr>
noremap <Left>  :echo "YOU NOOB!"<cr>
noremap <Right> :echo "YOU NOOB!"<cr>

" Multiple cursors
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_quit_key='<C-z>'
