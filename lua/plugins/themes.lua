return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd.colorscheme "tokyonight" end,
		enabled=false
  },
  {
    "RubenZwinkels/tokyonight",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd.colorscheme "tokyonight" end,
  },
}
