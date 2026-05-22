return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
            options = {
                always_show_bufferline = true,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer", -- Title
                        text_align = "left",    -- Align text to the left
                        separator = true,       -- Separator
                        highlight = "Directory",

                    }
                },
                -- style = "slant", ["slope", ..]
                separator_style = "slant",
                show_tab_indicators = true,
                mode = "buffers",
            }
    })

    -- Use <leader>tn to open a new empty buffer
    vim.keymap.set("n", "<leader>tn", "<cmd>enew<CR>", { desc = "New empty buffer" })

    -- Delete current buffer without collapsing the window (keeps nvim-tree offset intact)
    local function close_buffer(force)
        local cur = vim.api.nvim_get_current_buf()
        local alt = vim.fn.bufnr("#")
        if alt ~= -1 and alt ~= cur and vim.api.nvim_buf_is_valid(alt) and vim.bo[alt].buflisted then
            vim.api.nvim_set_current_buf(alt)
        else
            vim.cmd("bprevious")
        end
        if vim.api.nvim_get_current_buf() == cur then
            vim.cmd("enew")
        end
        pcall(vim.api.nvim_buf_delete, cur, { force = force })
    end

    -- Save and close current buffer (keep window layout)
    vim.keymap.set("n", "<leader>uq", function()
        vim.cmd("write")
        close_buffer(false)
    end, { desc = "Save and close buffer (keep window layout)" })

    -- Close current buffer without saving (keep window layout)
    vim.keymap.set("n", "<leader>q", function()
        close_buffer(true)
    end, { desc = "Close buffer without saving (keep window layout)" })
    end,
}
