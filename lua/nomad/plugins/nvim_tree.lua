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
                icons = {
                    glyphs = {
                        git = {
                            untracked = "+",
                        },
                    },
                },
            },
            filters = {
                dotfiles = false,
            },
        })

        -- toggle open/close
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
    end,
}
