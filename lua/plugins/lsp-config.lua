return {
  {
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local servers = require "lsp_servers"
      require("mason-lspconfig").setup {
        ensure_installed = servers,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require "lspconfig"
      local servers = require "lsp_servers"
      for i, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end
      -- keybindings
      vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<C-.>", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})
			vim.api.nvim_set_keymap('n', '<leader>lc', 'gcc', { noremap = false, silent = true })
		end,
  },
}
