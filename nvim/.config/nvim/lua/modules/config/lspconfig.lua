local vim = vim
local map = require("core.utils").map
local runtime_path = vim.split(package.path , ';')
local lspconfig = require("lspconfig")
local cmp = require("cmp_nvim_lsp")

local custom_attach = function(client)
    print("LSP started")

    map('n', 'gD', "<cmd>lua vim.lsp.buf.declaration()<CR>")
    map('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>")
    map('n', 'gs', "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    map('n', '<leader>le', "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>")
    map('n', '<leader>lr', "<cmd>lua vim.lsp.buf.rename()<CR>")
    map('n', '<leader>=', "<cmd>lua vim.lsp.buf.formatting()<CR>")
    map('n', '<leader>li', "<cmd>lua vim.lsp.buf.incoming_calls()<CR>")
    map('n', '<leader>lo', "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>")

    map('n', "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>")
    map('n', "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
    map('n', "gt", "<cmd>lua require('telescope.builtin').lsp_type_definition()<CR>")
    map('n', "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>")
    map('n', "<leader>ld", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
    map('n', "<leader>lw", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
    map('n', "<leader>la", "<cmd>lua require('telescope.builtin').lsp_code_action()<CR>")
    map('n', "<leader>lf", "<cmd>lua require('telescope.builtin').loclist()<CR>")
end

local custom_capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- c/c++
lspconfig.clangd.setup({
    init_options = {
        clangdFileStatus = true,
    },
    on_attach = custom_attach,
    capabilities = custom_capabilities,
})

-- clojure
lspconfig.clojure_lsp.setup({
    on_attach = custom_attach,
    capabilities = custom_capabilities,
})

-- cmake
lspconfig.cmake.setup({
    on_attach = custom_attach,
    capabilities = custom_capabilities,
})

-- julia
lspconfig.julials.setup({
    on_attach = custom_attach,
    capabilities = custom_capabilities,
})

-- lua
local sumneko_binary = "/usr/bin/lua-language-server"
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.sumneko_lua.setup({
    on_attach = custom_attach,
    cmd = { sumneko_binary },
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT', path = runtime_path, },
            completion = { KeywordSnippet = "Enable", },
            diagnotics = { enable = true, globals = { 'vim' } },
            workspace = {
                library = vim.api.nvim_get_runtime_file( "", true ),
            }
        }
    },
    capabilities = custom_capabilities,
})

-- python
lspconfig.pyright.setup({
    on_attach = custom_attach,
    capabilities = custom_capabilities,
})

-- rust
lspconfig.rust_analyzer.setup({
    on_attach = custom_attach,
    capabilities = custom_capabilities,
})
