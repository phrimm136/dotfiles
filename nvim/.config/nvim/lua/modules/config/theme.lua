local vim = vim

local material = require("material")

vim.g.material_style = "darker"

material.setup({
    plugins = {
    "nvim-cmp",
    "telescope",
    "which-key",
    }
})
vim.cmd 'colorscheme material'
