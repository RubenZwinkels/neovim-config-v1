return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<C-s>", ":Neotree toggle<CR>")
    vim.keymap.set("n", "C", ":Neotree set_root<CR>")

    require("neo-tree").setup {
      filesystem = {
        filtered_items = {
          visible = true, -- Toon gefilterde items
          hide_dotfiles = false, -- Laat .dotfiles zien
          hide_gitignored = false, -- Laat gitignored files zien
          show_hidden_count = true,
        },
      },
    }
    vim.cmd "Neotree close"
  end,
}
