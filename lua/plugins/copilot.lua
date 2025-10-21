return {
	{
		"github/copilot.vim",
	},
	{
  "folke/sidekick.nvim",
  opts = {
    -- add any options here
    cli = {
      default = "copilot",
      mux = {
        enabled = false,
      },
    },
  },
}
}
