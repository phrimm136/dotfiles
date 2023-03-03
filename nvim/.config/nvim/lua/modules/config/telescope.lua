local map = require("core.utils").map

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        find_command = {
            "rg",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        initial_mode = "insert",
        selection_stratedy = "reset",
        sorting_strategy = "descending",
        prompt_prefix = "> ",
        selection_caret = " ",
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { ".git", "node_modules", "__pycache__", },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        winblend = 0,
        scroll_strategy = "cycle",
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯",  "╰", },
        color_devicons = false,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor", },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_previewer = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center,
            },
        },
    },
})

map('n', "<Space>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
map('n', "<Space>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map('n', "<Space>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
map('n', "<Space>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
map('n', "<Space>fr", "<cmd>lua require('telescope.builtin').registers()<CR>")
map('n', "<C-Space>", "<cmd>lua require('telescope.builtin').commands()<CR>")
