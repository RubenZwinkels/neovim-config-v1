return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local dap = require "dap"
		local dapui = require "dapui"

		dap.listeners.before.attach.dapui_config = function() dapui.open() end
		dap.listeners.before.launch.dapui_config = function() dapui.open() end
		dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
		dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

		vim.keymap.set("n", "<leader> dc", function() dap.continue() end)
		vim.keymap.set("n", "<leader> do", function() dap.step_over() end)
		vim.keymap.set("n", "<leader di", function() dap.step_into() end)
		vim.keymap.set("n", "<leader> dO", function() dap.step_out() end)
		vim.keymap.set("n", "<Leader>db", function() dap.toggle_breakpoint() end)
		vim.keymap.set("n", "<Leader>dB", function() dap.set_breakpoint() end)
		vim.keymap.set("n", "<Leader>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ") end)
		vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end)
		vim.keymap.set("n", "<Leader>dl", function() dap.run_last() end)
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function() require("dap.ui.widgets").hover() end)
	end,
}

