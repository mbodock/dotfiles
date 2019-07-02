set nocompatible
set shell=bash

"Plugin list to Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()



Plug 'Xuyuanp/nerdtree-git-plugin'

" Shows git marks on numbers panel
Plug 'airblade/vim-gitgutter'

Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'chase/vim-ansible-yaml'
Plug 'ctrlpvim/ctrlp.vim'

" Python completion
Plug 'davidhalter/jedi-vim'

Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'hynek/vim-python-pep8-indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/rainbow_parentheses.vim'
" Plug 'klen/python-mode'
Plug 'mzlogin/vim-markdown-toc'
Plug 'nvie/vim-flake8'
Plug 'plasticboy/vim-markdown'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
call plug#end()

set wildmenu                    " shows menu when tab is pressed
set wildignore=*/htmlcov/*,*/functional*,*.swp,*.bak,*.pyc,*.class,*/node_modules/*,*/bower_components/*
set title                       " change the terminal's title
set cursorline                  " Highline the current line
set cc=80
set encoding=utf8

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

" xmllit current document
nnoremap <c-h><c-x> :silent %!xmllint --format -<cr>

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
nnoremap / /\v
vnoremap / /\v

" Show invisible chars
map <silent> <C-m> :set list!<CR>
set listchars=tab:▸\ ,space:·,eol:¬

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
nmap <leader>O :NERDTreeTabsToggle<cr>
nmap <F3> :noh<cr>
nmap <leader>k ddkkp
nmap <leader>j ddp
nmap <F8> :lnext<cr>

" Removendo lag ao sair do modo de inserção
set ttimeoutlen=50


" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

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
let g:pymode_options_max_line_length = 100
let g:pymode_folding = 0
let g:pymode_rope_rename_bind = '<C-h>rr'
let g:pymode_rope_organize_imports_bind = '<C-h>ri'
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_bind = '<C-h>ra'


if isdirectory(expand($HOME . '/.vim/plugged/'))
     if isdirectory(expand($HOME . '/.vim/plugged/vim-colors-solarized/'))
         set background=dark
         let g:solarized_termcolors=256
         set t_Co=256
         colorscheme solarized
     endif

    " Vim-airline configs
    if isdirectory(expand($HOME . '/.vim/plugged/vim-airline/'))
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        let g:airline_theme = 'powerlineish'
        let g:airline#extensions#branch#enabled = 1
        set laststatus=2
    endif

    if isdirectory(expand($HOME . '/.vim/plugged/vim-airline/'))

        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_aggregate_errors = 1
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 2
        let g:syntastic_check_on_wq = 0
        let g:syntastic_enable_highlighting = 1
        let g:syntastic_error_symbol = '✗'
        let g:syntastic_warning_symbol = '⚠'
        let g:syntastic_python_checkers = ['flake8']
    endif
    if isdirectory(expand($HOME . '/.vim/plugged/jedi-vim/'))
        let g:jedi#use_tabs_not_buffers = 1
        let g:jedi#show_call_signatures = 2
    endif

    if isdirectory(expand($HOME . '/.vim/plugged/ultisnips/'))
        let g:UltiSnipsExpandTrigger="<c-k>"
        let g:UltiSnipsJumpForwardTrigger="<c-l>"
    endif
    if isdirectory(expand($HOME . '/.vim/plugged/rainbow_parentheses.vim/'))
        au VimEnter * RainbowParenthesesToggle
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces
    endif
    if isdirectory(expand($HOME . '/.vim/plugged/vim-go/'))
        let g:go_fmt_fail_silently = 1
    endif
endif


" Use The Silver Searcher over grep, iff possible
if executable('ag')
   " Use ag over grep
   set grepprg=ag\ --nogroup\ --nocolor
endif

" Fix text background color
hi Normal ctermbg=NONE


" Config for JS
autocmd FileType js setlocal ts=2 sts=2 sw=2
autocmd FileType yml setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType jsx setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
