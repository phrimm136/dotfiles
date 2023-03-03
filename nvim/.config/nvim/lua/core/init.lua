local system = require('core.system')
local vim = vim
local map = require("core.utils").map
local is_vscode = require("core.utils").is_vscode

local M = {}

local create_dir = function ()
    local data_dir = {
        system.cache_dir .. 'backup/',
        system.cache_dir .. 'session/',
        system.cache_dir .. 'swap/',
        system.cache_dir .. 'tags/',
        system.cache_dir .. 'undo/',
    }

    if vim.fn.isdirectory(system.cache_dir) == 0 then
        os.execute("mkdir -p " .. system.cache_dir)
        for _, v in pairs(data_dir) do
            if vim.fn.isdirectory(v) == 0 then
                os.execute("mkdir -p " .. v)
            end
	end
    end
end

local disable_distribution_plugins = function ()
    vim.g.loaded_gzip = 1
    vim.g.loaded_tar = 1
    vim.g.loaded_tarPlugin = 1
    vim.g.loaded_zip = 1
    vim.g.loaded_zipPlugin = 1
    vim.g.loaded_getscript = 1
    vim.g.loaded_getscriptPlugin = 1
    vim.g.loaded_vimball = 1
    vim.g.loaded_vimballPlugin = 1
    vim.g.loaded_matchit = 1
    vim.g.loaded_matchparen = 1
    vim.g.loaded_2html_plugin = 1
    vim.g.loaded_logiPat = 1
    vim.g.loaded_rrhelper = 1
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.g.loaded_netrwSettings = 1
    vim.g.loaded_netrwFileHanders = 1
end

local leader_map = function ()
    vim.g.mapleader = ' '
    map('n', ' ', '')
    map('x', ' ', '')
end

create_dir()
disable_distribution_plugins()
if is_vscode then
    leader_map()
end

require('core.options').load_options()
require('core.autocmd').load_autocmd()

return M
