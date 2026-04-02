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

-- Jump to the first tab with '1' or 'leader + 1'
vim.keymap.set('n', '<leader>1', ':tabnext 1<CR>', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<leader>2', ':tabnext 2<CR>', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<leader>3', ':tabnext 3<CR>', { desc = 'Go to tab 3' })

vim.keymap.set('n', '<leader>re', ':Rex<CR>')  -- Return to Explorer

-- While your cursor is in the Right window, use these to flip through files:
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next File' })
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', { desc = 'Previous File' })
