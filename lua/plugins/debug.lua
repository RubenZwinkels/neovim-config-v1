return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"
    local mason_dap = require "mason-nvim-dap"

    -- Mason DAP setup
    mason_dap.setup {
      ensure_installed = {}, -- je gebruikt netcoredbg handmatig
      automatic_installation = false,
    }

    -- UI automatisch openen/sluiten
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    -- C# adapter configuratie met netcoredbg
    dap.adapters.coreclr = {
      type = "executable",
      command = vim.fn.expand "~/tools/netcoredbg/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "Launch - netcoredbg",
        request = "launch",
        program = function() return vim.fn.input("Path to DLL: ", vim.fn.getcwd() .. "/bin/Debug/net9.0/", "file") end,
      },
    }

    -- Keybindings
    vim.keymap.set("n", "<leader>dc", function() dap.continue() end)
    vim.keymap.set("n", "<leader>do", function() dap.step_over() end)
    vim.keymap.set("n", "<leader>di", function() dap.step_into() end)
    vim.keymap.set("n", "<leader>dO", function() dap.step_out() end)
    vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end)
    vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint() end)
    vim.keymap.set("n", "<leader>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ") end)
    vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end)
    vim.keymap.set("n", "<leader>dl", function() dap.run_last() end)
    vim.keymap.set({ "n", "v" }, "<leader>dh", function() require("dap.ui.widgets").hover() end)

    -- Stop debuggen
    vim.keymap.set("n", "<leader>dq", function()
      dap.terminate()
      dapui.close()
    end)

    -- DAP UI setup
    require("dapui").setup()
  end,
}
