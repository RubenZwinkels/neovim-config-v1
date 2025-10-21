return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.keymap.set("n", "<C-s>", ":Neotree toggle<CR>")
			vim.keymap.set("n", "C", ":Neotree set_root<CR>")

			require("neo-tree").setup {
				filesystem = {
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = false,
						show_hidden_count = true,
					},
					hijack_netrw_behavior = "disabled",
				},
			}

			-- Open Telescope automatisch bij starten
			-- vim.api.nvim_create_autocmd("VimEnter", {
				-- callback = function() vim.cmd "Telescope find_files" end,
		-- 	})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require "telescope"
			local actions = require "telescope.actions"
			local action_state = require "telescope.actions.state"
			local harpoon = require "harpoon"

			local function delete_harpoon_entry(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				if selection then harpoon:list():remove(selection.index) end
				actions.close(prompt_bufnr)
				require("telescope.builtin").harpoon_marks()
			end

			local builtin = require "telescope.builtin"
			vim.keymap.set("n", "<leader>tf", builtin.find_files, {})
			vim.keymap.set("n", "<leader>tn", function() builtin.find_files { cwd = vim.fn.stdpath "config" } end)
			vim.keymap.set("n", "<leader>th", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>tg", builtin.live_grep, {})

			telescope.setup {
				defaults = {
					file_ignore_patterns = {},
				},
				pickers = {
					find_files = {
						hidden = true, -- <— laat .files zien
					},
				},
				extensions = {
					harpoon = {
						mappings = {
							i = { ["<C-d>"] = delete_harpoon_entry },
							n = { ["d"] = delete_harpoon_entry },
						},
					},
				},
			}

			telescope.load_extension "harpoon"
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {},
					},
				},
			}
			require("telescope").load_extension "ui-select"
		end,
	},
}
