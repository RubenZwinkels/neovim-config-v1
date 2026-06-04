return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local servers = require("lsp_servers")
      require("mason-lspconfig").setup {
        ensure_installed = servers,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = require "lsp_servers"

      -- Configure gopls with special settings
      vim.lsp.config("gopls", {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        capabilities = capabilities,
        settings = {
          gopls = {
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            analyses = {
              unreachable = true,
              nilness = true,
            },
          },
        },
      })

      -- Configure other servers
      for _, server in ipairs(servers) do
        if server ~= "gopls" then
          vim.lsp.config(server, {
            capabilities = capabilities,
          })
        end
      end

      vim.lsp.enable(servers)

      -- keybindings
      vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<C-.>", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>lp", vim.lsp.buf.signature_help, {})
      vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "LSP Signature Help" })
      vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, {})
      vim.api.nvim_set_keymap("n", "<leader>lc", "gcc", { noremap = false, silent = true })
    end,
  },
}
