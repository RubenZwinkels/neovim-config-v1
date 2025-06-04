return {
  {
    "github/copilot.vim",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- of zbirenbaum/copilot.lua
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
        layout = "vertical",
        width = 0.5,
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts) -- belangrijk voor correcte initialisatie

      local map = vim.keymap.set
      local chat_cmd = function(cmd)
        return "<cmd>" .. cmd .. "<CR>"
      end

      map("n", "<leader>cc", chat_cmd("CopilotChat"), { desc = "Copilot Chat" })
      map("n", "<leader>ce", chat_cmd("CopilotChatExplain"), { desc = "Copilot Uitleg" })
      map("n", "<leader>cf", chat_cmd("CopilotChatFix"), { desc = "Copilot Fix" })
      map("n", "<leader>ct", chat_cmd("CopilotChatTests"), { desc = "Copilot Genereer Tests" })
      map("n", "<leader>co", chat_cmd("CopilotChatOptimize"), { desc = "Copilot Optimaliseer" })
      map("n", "<leader>cd", chat_cmd("CopilotChatDoc"), { desc = "Copilot Documentatie" })
      map("n", "<leader>cm", chat_cmd("CopilotChatCommit"), { desc = "Copilot Commit Message" })
    end,
  },
}
