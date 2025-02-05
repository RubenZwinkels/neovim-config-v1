vim.o.expandtab = false      -- Gebruik tabs in plaats van spaces
vim.o.tabstop = 4            -- Breedte van een tab is 4 spaces
vim.o.shiftwidth = 4         -- Indentering gebruikt 4 spaces per niveau
vim.o.softtabstop = 4        -- Backspace werkt correct met tabs als 4 spaces
vim.o.smarttab = true        -- Zorgt ervoor dat tab-toets rekening houdt met shiftwidth
vim.o.number = true
vim.opt.relativenumber = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup("plugins")

-- Configuratie voor Treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {
    "python", "c", "css", "csv", "dockerfile", "html", "java",
    "sql", "yaml", "json", "lua", "javascript"
  },
  highlight = { enable = true },
  indent = { enable = true },
})

	-- Keybindings
-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
	-- file tree
vim.keymap.set("n", "<C-s>", ":Neotree toggle<CR>")

-- Thema instellen
vim.cmd.colorscheme("tokyonight")
