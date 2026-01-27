return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function search_count()
      local sc = vim.fn.searchcount({recompute = 0}).total
      if sc == 0 then return "" end
      return "🔍" .. sc
    end

    require('lualine').setup({
      options = {
        theme = "gruvbox",        -- je kan hier dark-soft gebruiken als je custom theme hebt
        section_separators = { left = '', right = '' },
        component_separators = { left = '|', right = '|' },
        icons_enabled = true,
      },
      sections = {
        lualine_a = { "mode" },   -- links
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "diff", "diagnostics", search_count }, -- rechts
        lualine_y = {},
        lualine_z = {}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    })
  end
}
