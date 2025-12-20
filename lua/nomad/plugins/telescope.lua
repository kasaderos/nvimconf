return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",

	dependencies = {
		"nvim-lua/plenary.nvim"
	},

	config = function()
		require('telescope').setup({
            pickers = {
                lsp_document_symbols = {
                    layout_strategy = "horizontal", -- Use horizontal for more width
                    layout_config = {
                        width = 0.85,  -- 85% of the screen width
                        height = 0.7,  -- Adjust height if needed
                        preview_width = 0.5,  -- Increase preview area
                    },
                    symbol_width = 40,
                },
            },
        })

		local builtin = require('telescope.builtin')

		-- Find files
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })

		-- Live grep (search in files)
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep (search in files)" })

		-- Search help tags
		vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = "Search help tags" })

		-- Find Git files
		vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find Git files" })

		-- Search for the current word in the project
		vim.keymap.set('n', '<leader>tws', function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end, { desc = "Search for the current word in project" })

		-- Search for the current whole WORD in the project
		vim.keymap.set('n', '<leader>tss', function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end, { desc = "Search for the current whole WORD in project" })

		-- Manual grep input
		vim.keymap.set('n', '<leader>gg', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Search project manually (Grep prompt)" })

		-- List functions/methods in the current document
		vim.keymap.set('n', '<leader>lf', function()
            builtin.lsp_document_symbols({ symbols = { 'function', 'method' } })
		end, { desc = "List functions and methods in document" })
	end
}
