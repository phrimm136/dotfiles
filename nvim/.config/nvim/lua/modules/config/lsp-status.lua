return function()
    local lsp_status = require("lsp_status")

    lsp_status.config({
        indicator_errors = 'E',
        indicator_warnings = 'W',
        indicator_info = 'i',
        indicator_hint = '?',
        indicator_ok = 'Done',
    })
    lsp_status.register_progress()
end
