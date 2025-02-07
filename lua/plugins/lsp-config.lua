return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local servers = require("lsp_servers")
			require("mason-lspconfig").setup({
				ensure_installed = servers
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local servers = require("lsp_servers")
			for i, server in ipairs(servers) do
				lspconfig[server].setup({})
			end
		end
	},
}
