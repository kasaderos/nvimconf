return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,   dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            -- config
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,
            },
            git = {
                enable = true,
                ignore = false, -- show gitignored files
                show_on_dirs = true,
                show_on_open_dirs = true,
            },
        })

        -- toggle open/close
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
    end,
}
