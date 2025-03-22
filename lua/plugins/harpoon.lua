return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require "harpoon"
    local harpoon_mark = require "harpoon.mark"
    local harpoon_ui = require "harpoon.ui"
    local telescope = require "telescope"

    telescope.load_extension "harpoon"

    -- Keybindings voor Harpoon
    vim.keymap.set("n", "<leader>ha", function() harpoon_mark.add_file() end, { desc = "Harpoon add file" })
    vim.keymap.set(
      "n",
      "<leader>hh",
      function() require("telescope").extensions.harpoon.marks() end,
      { desc = "Telescope Harpoon" }
    )

    vim.keymap.set("n", "<leader>hd", function()
      local idx = vim.fn.input "Harpoon index to delete: "
      if tonumber(idx) then harpoon:list():remove(tonumber(idx)) end
    end, { desc = "Delete Harpoon item" })

    for i = 1, 9 do
      vim.keymap.set("n", "<leader>" .. i, function() harpoon_ui.nav_file(i) end, { desc = "Harpoon file " .. i })
    end
  end,
}
