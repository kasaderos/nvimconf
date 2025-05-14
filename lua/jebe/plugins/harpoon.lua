return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        require('harpoon').setup({})
        local harpoon = require('harpoon')

        -- Basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        -- Keymaps with descriptions
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add current buffer to Harpoon list" })
        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open Harpoon list with Telescope" })

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Jump to 1st Harpoon tab" })
        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(2) end, { desc = "Jump to 2rd Harpoon tab" })
        vim.keymap.set("n", "<C-s>", function() harpoon:list():select(3) end, { desc = "Jump to 3th Harpoon tab" })
        --vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Jump to 2nd Harpoon tab" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Go to previous Harpoon buffer" })
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Go to next Harpoon buffer" })
    end
}
