return {
  {
    "github/copilot.vim",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken", -- Alleen voor MacOS/Linux
    opts = {
      show_help = true,
      mappings = {
        submit_prompt = "<CR>",
        close = "<Esc>",
      },
      window = {
        layout = 'vertical',
        width = 0.5,
      },
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Copilot Chat" },
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Copilot Uitleg (Explain)" },
      { "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "Copilot Fix" },
      { "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "Copilot Genereer Tests" },
      { "<leader>co", "<cmd>CopilotChatOptimize<cr>", desc = "Copilot Optimaliseer" },
      { "<leader>cd", "<cmd>CopilotChatDoc<cr>", desc = "Copilot Genereer Documentatie" },
      { "<leader>cm", "<cmd>CopilotChatCommit<cr>", desc = "Copilot Commit Message" },
    },
  },
}
