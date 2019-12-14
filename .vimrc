" Plugin
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'mkitt/tabline.vim'
Plug 'chrisbra/unicode.vim'
Plug 'jiangmiao/auto-pairs'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Auto indent
set autoindent
set cindent

" Show line nmbers
set nu

" Syntax highlighting
if has("syntax")
    syntax on
endif

" Tab to 4 spaces
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4

" scroll
set mouse=a

" save cursor location
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" airline theme
let g:airline_theme='minimalist'

" airline-tabline integration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
