local utils = require("core.utils")

require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "cpp", "rust", "latex", "python", "julia", "lua", "clojure", },
    highlight = { enable = utils.isn_vscode },
    autopairs = { enable = utils.isn_vscode },
    indent = { enable = utils.isn_vscode },
    increament_selection = { enable = true },
    rainbow = { enable = utils.isn_vscode },
    matchup = { enable = true },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner"
            }
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]]"] = "@function.outer",
            },
            goto_next_end = {
                ["]["] = "@function.outer",
            },
            goto_previous_start = {
                ["[["] = "@function.outer",
            },
            goto_previous_end = {
                ["[]"] = "@function.outer",
            },
        }
    }
})
