local utils = require("core.utils")

local npairs = require("nvim-autopairs")
if utils.isn_vscode then
    local npairs_cmp = require("nvim-autopairs.completion.cmp")
end

npairs.setup({
    enable_check_bracket_line = false,
})
--
-- npairs_cmp.setup({
--     map_cr = true,
--     map_complete = true,
--     auto_select = true,
--     insert = false,
--     map_char = {
--         all = '(',
--         tex = '{',
--     },
-- })
