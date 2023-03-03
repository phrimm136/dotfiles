local vim = vim
local api = vim.api

local M = {}

local nvim_create_augroups = function (autocmds)
    for group_name, defs in pairs(autocmds) do
        api.nvim_command("augroup" .. group_name)
        api.nvim_command("autocmd!")
        for _, def in ipairs(defs) do
            api.nvim_command(table.concat(vim.tbl_flatten{ "autocmd", def }, ' '))
        end
        api.nvim_command("augroup END")
    end
end

function M.load_autocmd()
    local autocmds = {}

    nvim_create_augroups(autocmds)
end

return M
