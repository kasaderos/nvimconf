return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer", -- Title
            text_align = "left",    -- Align text to the left
            separator = true        -- Separator
          }
        },
        -- style = "slant", ["slope", ..]
        separator_style = "slant",
        show_tab_indicators = true,
        mode = "buffers",
      }
    })

    local function close_buffer()
        local bufnr = vim.api.nvim_get_current_buf()

        -- If the current buffer is NvimTree, close it and return
        if vim.bo.filetype == "NvimTree" then
            return
        end

        -- If the current buffer is the last one, open a new empty buffer before closing
        vim.cmd("BufferLineCyclePrev")

        -- Remove the current buffer
        vim.cmd("bdelete " .. bufnr)
    end


    -- Use <leader>q to pick a buffer to close
    vim.keymap.set("n", "<leader>q", "<cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close" })
    -- Use <leader>w to close the current buffer without losing focus
    vim.keymap.set("n", "<leader>w", close_buffer, { desc = "Close buffer and keep focus" })

    -- Use <leader>tn to open a new empty buffer
    vim.keymap.set("n", "<leader>tn", "<cmd>enew<CR>", { desc = "New empty buffer" })
    end,
}
