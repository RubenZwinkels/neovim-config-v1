return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "TroubleToggle",
  keys = {
    { "<leader>lx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
    { "<leader>lX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
    { "<leader>lq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix" },
    { "<leader>ll", "<cmd>TroubleToggle loclist<cr>", desc = "Location List" },
    { "<leader>lr", "<cmd>TroubleToggle lsp_references<cr>", desc = "LSP References" },
  },
  opts = {
    use_diagnostic_signs = true,
  },
}
