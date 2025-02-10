return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		vim.keymap.set("n", "<C-s>", ":Neotree toggle<CR>")
		local config = require "nvim-treesitter.configs"
		config.setup {
			ensure_installed = {
				"python",
				"c",
				"css",
				"csv",
				"dockerfile",
				"html",
				"java",
				"sql",
				"yaml",
				"json",
				"lua",
				"javascript",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		}
	end,
}
