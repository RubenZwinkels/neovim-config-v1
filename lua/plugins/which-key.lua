return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require "which-key"
        local dap = require "dap"

        wk.register({
            l = {
                name = "LSP",
                h = { vim.lsp.buf.hover, "Hover Documentation" },
                d = { vim.lsp.buf.definition, "Go to Definition" },
                r = { vim.lsp.buf.rename, "Rename Symbol" },
                f = { vim.lsp.buf.format, "Format Code" },
                c = { "gcc", "Comment Line" },
            },
            t = {
                name = "Telescope",
                f = { require("telescope.builtin").find_files, "Find Files" },
                n = { require("telescope.builtin").find_files, "FF NeoVim config" },
            },
            g = {
                name = "Git",
                d = { ":Gitsigns preview_hunk<CR>", "Show git diff" },
            },
            d = {
                name = "Debugger",
                c = { function() dap.continue() end, "Continue" },
                o = { function() dap.step_over() end, "Step Over" },
                i = { function() dap.step_into() end, "Step Into" },
                O = { function() dap.step_out() end, "Step Out" },
                b = { function() dap.toggle_breakpoint() end, "Toggle Breakpoint" },
                B = { function() dap.set_breakpoint() end, "Set Breakpoint" },
                lp = { function() dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ") end, "Set Log Point" },
                r = { function() dap.repl.open() end, "Open REPL" },
                l = { function() dap.run_last() end, "Run Last" },
                h = { function() require("dap.ui.widgets").hover() end, "Hover Debug Info" },
								q = {	function() dap.terminate() end, "Quit"	},
            },
			h = {
				name = "Harpoon",
				a = {function() require("harpoon.mark").add_file() end, "Add file"},
				h = {function() require("telescope").extensions.harpoon.marks() end, "Open harpoon"},
			},
        },

			{ prefix = "<leader>" })
        wk.register {
            ["<C-.>"] = { vim.lsp.buf.code_action, "Code Actions" },
        }
    end,
}
