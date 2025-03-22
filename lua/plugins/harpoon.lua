return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require "harpoon"
    local harpoon_telescope = require "config.harpoon_telescope"

    harpoon.setup()

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "Harpoon add file" })
    vim.keymap.set("n", "<leader>ht", harpoon_telescope, { desc = "Telescope Harpoon" })
    for i = 1, 9 do
      vim.keymap.set("n", "<leader>h" .. i, function() harpoon:list():select(i) end, { desc = "Harpoon file " .. i })
    end
  end,
}
