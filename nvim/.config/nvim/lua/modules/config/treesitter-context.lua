return function()
    local tc = require("treesitter-context")

    tc.setup({
        enable = true,
        throttle = true,
        max_lines = 0,
        patterns = {
            'class',
            'function',
            'method',
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
        },
    })
end
