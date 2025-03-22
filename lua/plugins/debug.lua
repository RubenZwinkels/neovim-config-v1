return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local mason_dap = require("mason-nvim-dap")

		require("dapui").setup()

    -- Mason DAP automatisch installeren
    mason_dap.setup({
      ensure_installed = { "codelldb" },
      automatic_installation = true,
    })

    -- DAP UI open/close automatisch
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    -- C/C++ Debug Adapter Configuratie
    dap.adapters.lldb = {
      type = "executable",
      command = vim.fn.stdpath("data") .. "/mason/bin/codelldb", -- Mason pad
      name = "lldb",
    }

    dap.configurations.c = {
      {
        name = "Launch file",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }

    dap.configurations.cpp = dap.configurations.c

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
  end,
}
