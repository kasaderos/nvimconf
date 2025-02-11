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
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		-- help
		vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
		vim.keymap.set('n', '<C-p>', builtin.git_files, {})
		vim.keymap.set('n', '<leader>tws', function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set('n', '<leader>tss', function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		-- grep
		vim.keymap.set('n', '<leader>gg', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
        -- list functions/methods
		vim.keymap.set('n', '<leader>lf', function()
            builtin.lsp_document_symbols({ symbols={'function', 'method'} })	end, { desc = "open list of functions"})
	end
}
