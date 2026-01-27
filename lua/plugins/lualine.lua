return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
  },
  config = function()
    local function blame_if_not_me()
      local blame = vim.b.gitsigns_blame
      if not blame or blame.author == "Ruben Zwinkels" then
        return ""
      end
      return " " .. blame.author
    end

    require("lualine").setup({
      options = {
        theme = "auto",   -- default look
        icons_enabled = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {
          { "diff" },
          { "diagnostics" },
          blame_if_not_me,
        },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
