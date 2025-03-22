return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            local function delete_selected_entry(prompt_bufnr)
                local entry = action_state.get_selected_entry()
                if entry then
                    -- Verwijder het item (afhankelijk van de context)
                    print("Item verwijderd:", entry.value)
                    actions.close(prompt_bufnr)
                end
            end

            -- Basis keybinds voor Telescope
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>tf", builtin.find_files, {})
            vim.keymap.set("n", "<leader>tn", function()
                builtin.find_files { cwd = vim.fn.stdpath("config") }
            end)
            vim.keymap.set("n", "<leader>th", builtin.help_tags, {})

            -- Voeg delete functionaliteit toe aan Telescope
            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-d>"] = delete_selected_entry, -- Verwijder met Ctrl + D in insert mode
                        },
                        n = {
                            ["d"] = delete_selected_entry, -- Verwijder met 'd' in normal mode
                        },
                    },
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
