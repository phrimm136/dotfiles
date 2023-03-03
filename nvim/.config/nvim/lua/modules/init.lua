local vim = vim
local cmd = vim.cmd
local utils = require("core.utils")

cmd("call plug#begin(stdpath('data') . '/plugged')")
cmd("Plug 'nvim-lua/plenary.nvim'")
cmd("Plug 'nvim-lua/popup.nvim'")
cmd("Plug 'tpope/vim-surround'")
cmd("Plug 'andymass/vim-matchup'")
cmd("Plug 'kana/vim-textobj-user'")
cmd("Plug 'Julian/vim-textobj-brace'")
cmd("Plug 'beloglazov/vim-textobj-quotes'")
cmd("Plug 'idbrii/textobj-word-column.vim'")
cmd("Plug 'tommcdo/vim-lion'")
cmd("Plug 'tpope/vim-repeat'")
cmd("Plug 'windwp/nvim-autopairs'")
if utils.isn_vscode then
    cmd("Plug 'nvim-telescope/telescope.nvim'")
    cmd("Plug 'nvim-treesitter/nvim-treesitter', { 'do' : 'TSUpdate' }")
    cmd("Plug 'nvim-treesitter/nvim-treesitter-textobjects'")
    -- cmd("Plug 'p00f/nvim-ts-rainbow'")
    cmd("Plug 'hrsh7th/nvim-cmp'")
    cmd("Plug 'hrsh7th/cmp-buffer'")
    cmd("Plug 'hrsh7th/cmp-nvim-lsp'")
    cmd("Plug 'neovim/nvim-lspconfig'")
    cmd("Plug 'folke/which-key.nvim'")
    cmd("Plug 'L3MON4D3/LuaSnip'")
    cmd("Plug 'marko-cerovac/material.nvim'")
    cmd("Plug 'cespare/vim-toml'")
    cmd("Plug 'terrortylor/nvim-comment'")
    cmd("Plug 'nicwest/vim-http'")
    cmd("Plug 'romgrk/barbar.nvim'")
end
if utils.is_vscode then
    cmd("Plug 'ChristianChiarulli/vscode-easymotion'")
end
cmd("call plug#end()")

if utils.isn_vscode then
    -- tree-sitter
    require("modules.config.treesitter")
    -- autopair
    require("modules.config.autopair")
    -- telescope
    require("modules.config.telescope")
    -- lsp
    require("modules.config.lspconfig")
    -- auto completion
    -- require("modules.config.cmp")
    -- snippet engine
    -- require("modules.config.luasnip")
    -- commenter
    require("modules.config.comment")
    -- keymap cheatsheet
    require("modules.config.whichkey")
    -- tab bar
    require("modules.config.barbar")
    -- theme
    require("modules.config.theme")
end
