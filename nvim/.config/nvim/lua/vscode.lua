local vim = vim
local map = require("core.utils").map

vim.cmd([[
    augroup julia
    autocmd!
    autocmd FileType julia nnoremap <buffer> <Space>r <Cmd>call VSCodeNotify('language-julia.startREPL')<CR>
    augroup END
]])

map("n", "gcc", "<Plug>VSCodeCommentaryLine")
map("v", "gc", "<Plug>VSCodeCommentary")
map("x", "gc", "<Plug>VSCodeCommentary")
