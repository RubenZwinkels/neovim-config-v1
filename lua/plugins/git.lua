return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("ikdiekd").setup()

		vim.keymap.set("n", "<leader> gd", "Gitsigns preview_hunk<CR>", {})
  end,
}
