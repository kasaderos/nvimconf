vim.g.mapleader = " "

-- Explorer
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex, { desc = "Open file explorer (netrw)" })

-- Cancel insert mode
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })

-- Copy selected block to system clipboard
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true, desc = "Yank selection to system clipboard" })

-- Copy current line to system clipboard
vim.keymap.set('n', '<leader>yl', '^v$"+yh', { noremap = true, silent = true, desc = "Yank current line to system clipboard" })

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true, desc = "Paste from system clipboard" })

-- Splitjoin plugin mappings
vim.g.splitjoin_split_mapping = ''
vim.g.splitjoin_join_mapping = ''

-- Split a one-liner into multiple lines
vim.keymap.set('n', '<leader>sp', ':SplitjoinSplit<CR>', { noremap = true, silent = true, desc = "Split single-line statement into multiple lines" })

-- Join multiple lines into a single line
vim.keymap.set('n', '<leader>jp', ':SplitjoinJoin<CR>', { noremap = true, silent = true, desc = "Join multiple lines into a single line" })


