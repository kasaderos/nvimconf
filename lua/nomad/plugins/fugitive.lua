return {
	"tpope/vim-fugitive",
	config = function()
		-- Open Git status
        vim.keymap.set("n", "<leader>git", ":tab Git<CR>", { desc = "Open Git status in new tab", silent = true })

		-- Git diff: Accept left (incoming) change
		vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>", { desc = "Git diff: Accept left (incoming) change", remap = false })

		-- Git diff: Accept right (current) change
		vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>", { desc = "Git diff: Accept right (current) change", remap = false })

        -- Compare current file with the last commit (HEAD)
        vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit HEAD<CR>", { desc = "Diff with HEAD (last commit)" })

        -- Compare current file with the master branch
        vim.keymap.set("n", "<leader>gm", "<cmd>Gvdiffsplit origin/master<CR>", { desc = "Diff with origin/master" })
	end
}
