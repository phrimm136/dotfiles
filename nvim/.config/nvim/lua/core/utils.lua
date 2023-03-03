local vim = vim

M = {}

function M.map(type, key, value)
    vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true, });
end

M.is_vscode = vim.fn.exists("g:vscode") == 1

M.isn_vscode = vim.fn.exists("g:vscode") ~= 1

return M
