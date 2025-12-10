return {
  {
    "github/copilot.vim",
    config = function()
      -- Voorkom dat Copilot automatisch grote suggesties pusht
      vim.g.copilot_auto_trigger = true -- subtiele inline suggesties
      vim.g.copilot_suggestion_delay = 75 -- sneller maar klein
    end,
  },
  {
    "folke/sidekick.nvim",
		config = function()
			require("sidekick.nes").disable()
		end,
    opts = {
      cli = {
        default = "copilot",
        mux = {
          enabled = false,
        },
      },
    },
  },
}
