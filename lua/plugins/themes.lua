return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd.colorscheme "tokyonight" end,
    enabled = false,
  },
  {
    "RubenZwinkels/tokyonight",
    lazy = false,
    priority = 1000,
		enabled = false,
    config = function() vim.cmd.colorscheme "tokyonight" end,
  },
 {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
		enabled = true,
    config = function()
      vim.o.background = "dark"
      vim.g.gruvbox_contrast_dark = "soft"
      vim.cmd.colorscheme "gruvbox"
    end,
  },
}
