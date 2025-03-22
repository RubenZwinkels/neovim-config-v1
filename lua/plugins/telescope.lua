return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            local harpoon = require("harpoon")

            local function delete_harpoon_entry(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    harpoon:list():remove(selection.index)
                end
                actions.close(prompt_bufnr)
                require("telescope.builtin").harpoon_marks() -- Direct heropenen voor visuele update
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
                extensions = {
                    harpoon = {
                        mappings = {
                            i = { ["<C-d>"] = delete_harpoon_entry },
                            n = { ["d"] = delete_harpoon_entry },
                        }
                    }
                }
            })
            require("telescope").load_extension("harpoon")
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
