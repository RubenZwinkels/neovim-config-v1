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
}
