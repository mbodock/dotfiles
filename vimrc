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

Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdtree'
Plugin 'StanAngeloff/php.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'leafgarland/typescript-vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dag/vim-fish'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on    " required

set wildmenu                    " shows menu when tab is pressed
set wildignore=*/htmlcov/*,*/functional*,*.swp,*.bak,*.pyc,*.class,*/node_modules/*
set title                       " change the terminal's title
set cursorline                  " Highline the current line

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Use shift-H and shift-L for move to beginning/end
nnoremap H 0
nnoremap L $

" Strip all trailing whitespace from a file, using \W
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Makes W write like w bot don't affect Word
cnoreabbrev W w

" Alias
command Sortline call setline('.', join(sort(split(getline('.'), ' ')), " "))


" Uses tab and shift+tab to change tabs
map <Tab> :tabnext<cr>
map <S-Tab> :tabprevious<cr>

" Show numbers on vim
set number

" Misc
set directory=/tmp
set exrc
set secure
set expandtab           " Tab inteligentes
set autoindent          " Auto ident after LB
set shiftwidth=4
set shiftround
set tabstop=4
set softtabstop=4
set hlsearch
set incsearch
set ignorecase
set smartcase           "If has uppercase chars search for inogres ignnorecase
set backspace=indent,eol,start
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <C-c> <Esc><Esc>
map 0 ^
set splitright
set splitbelow
set laststatus=2
set mouse=a
set noshowmode

" Always tell me the number of lines changed by a command
set report=0

" When wrapping text, if a line is so long that not all of it can be shown on
" the screen, show as much as possible anyway; by default Vim fills the left
" column with @ symbols instead, which I don't find very helpful
set display=lastline

" Don't wrap by default, but use \w to toggle it on or off quickly
set nowrap
nnoremap <leader>w :set wrap!<CR>

" bodocks =D
nmap <leader>o :NERDTreeToggle<cr>
nmap <F3> :noh<cr>
nmap <leader>k ddkkp
nmap <leader>j ddp

"Jedi-Vim
let g:jedi#popup_select_first = 0

" Removendo lag ao sair do modo de inserção
set ttimeoutlen=50

" Vim-Flake8
let g:flake8_max_line_length=99

" Make things hard Thx João
noremap <Up>    :echo "YOU NOOB!"<cr>
noremap <Down>  :echo "YOU NOOB!"<cr>
noremap <Left>  :echo "YOU NOOB!"<cr>
noremap <Right> :echo "YOU NOOB!"<cr>

" Multiple cursors
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_quit_key='<C-z>'

" If a file named ~/.vimrc.local exists, source its configuration; this is
" useful for defining filetype rules on systems which happen to have files of
" a known type with atypical suffixes or locations
if filereadable(glob('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" Remove folding on plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1

" Snippets
iabbrev eenc # encoding: utf-8

" PyMode: https://github.com/klen/python-mode
let g:pymode_options_max_line_length = 79
let g:pymode_folding = 0
let g:pymode_rope_rename_bind = '<C-h>rr'
let g:pymode_rope_organize_imports_bind = '<C-h>ri'
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_bind = '<C-h>ra'

" Collors and Themes
syntax on
filetype plugin indent on
syntax enable

if isdirectory(expand($HOME . '/.vim/bundle/Vundle.vim/'))
    if isdirectory(expand($HOME . '/.vim/bundle/vim-colors-solarized/'))
        set background=dark
        let g:solarized_termcolors=256
        set t_Co=256
        colorscheme solarized
    endif

    " Vim-airline configs
    if isdirectory(expand($HOME . '/.vim/bundle/vim-airline/'))
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        let g:airline_theme = 'powerlineish'
        set laststatus=2
    endif
endif

" Fix text background color
hi Normal ctermbg=NONE
