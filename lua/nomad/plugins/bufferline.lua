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
      }
    })

    -- Use <leader>q to pick a buffer to close
    vim.keymap.set("n", "<leader>q", "<cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close" })
    vim.keymap.set("n", "<leader>w", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
    end,
}
