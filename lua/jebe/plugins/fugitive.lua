return {
	"tpope/vim-fugitive",
	config = function()
		-- Open Git status
		vim.keymap.set("n", "<leader>git", vim.cmd.Git, { desc = "Open Git status window", remap = false })

		local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = ThePrimeagen_Fugitive,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()

				-- Git push
				vim.keymap.set("n", "<leader>gP", function()
					vim.cmd.Git('push')
				end, { desc = "Git push", buffer = bufnr, remap = false })

				-- Git pull with rebase
				vim.keymap.set("n", "<leader>gp", function()
					vim.cmd.Git({ 'pull', '--rebase' })
				end, { desc = "Git pull (rebase)", buffer = bufnr, remap = false })

				-- Git push with upstream branch selection
				vim.keymap.set("n", "<leader>t", ":Git push -u origin ",
					{ desc = "Git push with upstream branch selection", buffer = bufnr, remap = false })
			end,
		})

		-- Git diff: Accept left (incoming) change
		vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>", { desc = "Git diff: Accept left (incoming) change", remap = false })

		-- Git diff: Accept right (current) change
		vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>", { desc = "Git diff: Accept right (current) change", remap = false })
	end
}
