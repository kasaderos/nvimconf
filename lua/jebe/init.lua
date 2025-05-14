require('jebe.keymaps')
require('jebe.autocmds')
require('jebe.opts')
require('jebe.setup_plugins')

local augroup = vim.api.nvim_create_augroup
local autoCmdGroup = augroup('DefaultAutoCmdGroup', {})
local autocmd = vim.api.nvim_create_autocmd

-- Remove trailing whitespace before saving a file
autocmd("BufWritePre", {
    group = autoCmdGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Auto-organize imports and format Go files before saving
autocmd("BufWritePre", {
    group = autoCmdGroup,
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }

        -- Request LSP to organize imports
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end

        -- Format the buffer after applying edits
        vim.lsp.buf.format({ async = false })
    end
})

-- Attach keymaps when LSP attaches to a buffer
autocmd("LspAttach", {
    group = autoCmdGroup,
    callback = function(e)

        -- Go to definition
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Go to definition", buffer = e.buf })

        -- Go to implementation
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, { desc = "Go to implementation", buffer = e.buf })

        -- Show hover information
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "Show hover information", buffer = e.buf })

        -- Search workspace symbols
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { desc = "Search workspace symbols", buffer = e.buf })

        -- Open diagnostics in a floating window
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = "Open floating diagnostics", buffer = e.buf })

        -- Apply code action
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { desc = "Apply code action", buffer = e.buf })

        -- Show references
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { desc = "Show references", buffer = e.buf })

        -- Rename symbol
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { desc = "Rename symbol", buffer = e.buf })

        -- Show signature help (parameter hints)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "Show signature help", buffer = e.buf })

        -- Jump to next diagnostic
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "Jump to next diagnostic", buffer = e.buf })

        -- Jump to previous diagnostic
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { desc = "Jump to previous diagnostic", buffer = e.buf })
    end
})
