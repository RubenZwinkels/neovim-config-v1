return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require "which-key"

		wk.register({
			l = {
				name = "LSP", -- Groepeert LSP-acties onder <leader>l
				h = { vim.lsp.buf.hover, "Hover Documentation" },
				d = { vim.lsp.buf.definition, "Go to Definition" },
				r = { vim.lsp.buf.rename, "Rename Symbol" },
				f = { vim.lsp.buf.format, "Format Code" },
				c = { "gcc", "Comment Line" },
			},
			t = {
				name = "Telescope",
				f = { require("telescope.builtin").find_files, "Find Files" },
				n = { require("telescope.builtin").find_files, "FF NeoVim config" },
			},
			g = {
				name = "Git",
				d = { ":Gitsigns preview_hunk<CR>", "Show git diff" },
			},
		}, { prefix = "<leader>" })

		wk.register {
			["<C-.>"] = { vim.lsp.buf.code_action, "Code Actions" },
		}
	end,
}
