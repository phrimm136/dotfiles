local vim = vim
local is_vscode = require("core.utils").is_vscode

vim.cmd([[
    syntax off
    filetype off
    filetype plugin indent off
]])

vim.opt.shadafile = "NONE"

vim.defer_fn(function()
    require("core")
    require("modules")
    vim.opt.shadafile = ""
    vim.cmd([[
        rshada!
        doautocmd BufRead
        syntax on
        filetype on
        filetype plugin indent on
    ]])

    if is_vscode then
        require("vscode")
    end

    vim.defer_fn(function()
        -- require("keymap")
        -- vim.cmd([[
        --  PackerLoad which-key.nvim
        --  silent! bufdo e
        -- ]])
    end, 20)
end, 0)
