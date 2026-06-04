-- Go-specific settings and keybindings
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true

-- Go keybindings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = false, buffer = true }

keymap("n", "<leader>ga", "<cmd>GoAddTag<CR>", opts)
keymap("n", "<leader>gr", "<cmd>GoRemoveTag<CR>", opts)
keymap("n", "<leader>gts", "<cmd>GoTagsModify split<CR>", opts)
keymap("n", "<leader>gtj", "<cmd>GoTagsModify json<CR>", opts)
keymap("n", "<leader>gtt", "<cmd>GoTagsModify yaml<CR>", opts)
keymap("n", "<leader>gi", "<cmd>GoImport<CR>", opts)
keymap("n", "<leader>gI", "<cmd>GoImports<CR>", opts)
keymap("n", "<leader>gv", "<cmd>GoVet<CR>", opts)
keymap("n", "<leader>gt", "<cmd>GoTest<CR>", opts)
keymap("n", "<leader>gT", "<cmd>GoTestFile<CR>", opts)
keymap("n", "<leader>gc", "<cmd>GoCoverageToggle<CR>", opts)
keymap("n", "<leader>gb", "<cmd>GoBuild<CR>", opts)
keymap("n", "<leader>gx", "<cmd>GoRun<CR>", opts)

-- Auto-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = 0,
  callback = function()
    vim.lsp.buf.format()
  end,
})
