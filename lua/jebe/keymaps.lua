vim.g.mapleader = " "

-- explorer
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- cancel
vim.keymap.set("i", "<C-c>", "<Esc>")

-- copy selected block
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })
-- copy current line
vim.keymap.set('n', '<leader>yl', '^v$"+yh', { noremap = true, silent = true })

-- paste
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true })
