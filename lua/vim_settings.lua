vim.o.expandtab = false      -- Gebruik tabs in plaats van spaces
vim.o.tabstop = 2            -- Breedte van een tab is 2 spaces
vim.o.shiftwidth = 2         -- Indentering gebruikt 2 spaces per niveau
vim.o.softtabstop = 2        -- Backspace werkt correct met tabs als 2 spaces
vim.o.smarttab = true        -- Zorgt ervoor dat tab-toets rekening houdt met shiftwidth
vim.o.number = true
vim.opt.relativenumber = true
vim.o.showmode = false		-- zodat het niet dubbel staat onder lualine
vim.opt.clipboard = "unnamedplus" -- voor de macos clipboard
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- NOTE: Ensures that when exiting NeoVim, Zellij returns to normal mode
vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    command = "silent !zellij action switch-mode normal"
})

-- vaste macros
vim.cmd('let @a = "gg0VGy"') --yank all
