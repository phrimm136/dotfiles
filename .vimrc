"Auto indent
set autoindent
set cindent

"Show line nmbers
set nu

"Syntax highlighting
if has("syntax")
    syntax on
endif

" tab to 4 spaces
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4

"scroll
set mouse=a

"autopair
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>

"save cursor location
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
