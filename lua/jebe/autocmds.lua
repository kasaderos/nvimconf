local augroup = vim.api.nvim_create_augroup
local autoCmdGroup = augroup('DefaultAutoCmdGroup', {})
local autocmd = vim.api.nvim_create_autocmd

-- Remove trailing whitespace before saving (Disabled by default)
-- autocmd({"BufWritePre"}, {
-- 	group = autoCmdGroup,
-- 	pattern = "*",
-- 	command = [[%s/\s\+$//e]],
-- })

-- LSP keybindings when a language server attaches
autocmd('LspAttach', {
	group = autoCmdGroup,
	callback = function(e)
		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
			{ desc = "Go to definition", buffer = e.buf })

		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
			{ desc = "Show hover documentation", buffer = e.buf })

		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
			{ desc = "Search workspace symbols", buffer = e.buf })

		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
			{ desc = "Show floating diagnostics", buffer = e.buf })

		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
			{ desc = "Show available code actions", buffer = e.buf })

		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
			{ desc = "Find references", buffer = e.buf })

		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
			{ desc = "Rename symbol", buffer = e.buf })

		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
			{ desc = "Show signature help", buffer = e.buf })

		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
			{ desc = "Jump to next diagnostic", buffer = e.buf })

		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
			{ desc = "Jump to previous diagnostic", buffer = e.buf })
	end
})
