return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require "which-key"
		local dap = require "dap"

		wk.register({
			l = {
				name = "LSP",
				h = { vim.lsp.buf.hover, "Hover Documentation" },
				d = { vim.lsp.buf.definition, "Go to Definition" },
				r = { vim.lsp.buf.rename, "Rename Symbol" },
				f = { vim.lsp.buf.format, "Format Current Buffer" },
				F = { function() vim.lsp.buf.format { async = true, range = nil } end, "Format Entire Project" },
				c = { "gcc", "Comment Line" },
				x = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)" },
				X = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)" },
				s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)" },
				l = { "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "LSP Definitions/References (Trouble)" },
				L = { "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)" },
			},
			t = {
				name = "Telescope",
				f = { require("telescope.builtin").find_files, "Find Files" },
				n = { require("telescope.builtin").find_files, "FF NeoVim config" },
				g = { require("telescope.builtin").live_grep, "Live grep" },
				h = { require("telescope.builtin").help_tags, "FF help pages" },
			},
			g = {
				name = "Git",
				d = { ":Gitsigns preview_hunk<CR>", "Show git diff" },
			},
			d = {
				name = "Debugger",
				c = { function() dap.continue() end, "Continue" },
				o = { function() dap.step_over() end, "Step Over" },
				i = { function() dap.step_into() end, "Step Into" },
				O = { function() dap.step_out() end, "Step Out" },
				b = { function() dap.toggle_breakpoint() end, "Toggle Breakpoint" },
				B = { function() dap.set_breakpoint() end, "Set Breakpoint" },
				lp = { function() dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ") end, "Set Log Point" },
				r = { function() dap.repl.open() end, "Open REPL" },
				l = { function() dap.run_last() end, "Run Last" },
				h = { function() require("dap.ui.widgets").hover() end, "Hover Debug Info" },
				q = { function() dap.terminate() end, "Quit" },
			},
			h = {
				name = "Harpoon",
				a = { function() require("harpoon.mark").add_file() end, "Add file" },
				h = { function() require("telescope").extensions.harpoon.marks() end, "Open harpoon" },
			},
			f = {
				name = "flash",
				f = { function() require("flash").jump() end, "Flash jump" },
				t = { function() require("flash").treesitter() end, "Flash Treesitter" },
				r = { function() require("flash").remote() end, "Remote Flash" },
				s = { function() require("flash").treesitter_search() end, "Treesitter Search" },
			},
			s = {
				name = "Sidekick",
				["<tab>"] = {
					function()
						if not require("sidekick").nes_jump_or_apply() then return "<Tab>" end
					end,
					"Goto/Apply Next Edit Suggestion",
					expr = true,
				},
				["<C-,>"] = { function() require("sidekick.cli").toggle() end, "Toggle Sidekick", mode = { "n", "t", "i", "x" } },
				a = { function() require("sidekick.cli").toggle() end, "Toggle CLI" },
				s = { function() require("sidekick.cli").select() end, "Select CLI" },
				d = { function() require("sidekick.cli").close() end, "Detach CLI" },
				t = { function() require("sidekick.cli").send { msg = "{this}" } end, "Send This", mode = { "x", "n" } },
				f = { function() require("sidekick.cli").send { msg = "{file}" } end, "Send File" },
				v = {
					function() require("sidekick.cli").send { msg = "{selection}" } end,
					"Send Visual Selection",
					mode = { "x" },
				},
				p = { function() require("sidekick.cli").prompt() end, "Prompt", mode = { "n", "x" } },
				c = { function() require("sidekick.cliy").toggle { name = "claude", focus = true } end, "Toggle Claude" },
			},
			g = {
				name = "Gamification",
				g =	{ function() require("triforce").show_profile() end, "Show Profile" },
			}
		}, { prefix = "<leader>" })
		wk.register {
			["<C-.>::"] = { vim.lsp.buf.code_action, "Code Actions" },
		}
	end,
}
