return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")
    local harpoon_telescope = require("config.harpoon_telescope")

    harpoon.setup()

    vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Harpoon add file" })
    vim.keymap.set("n", "<leader>fh", harpoon_telescope, { desc = "Telescope Harpoon" })
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
  end,
}
