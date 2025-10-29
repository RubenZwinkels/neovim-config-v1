vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
-- .editorconfig fixen
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    vim.cmd("silent! EditorConfigReload")
  end,
})
-- algemene instellingen voor C#
vim.cmd [[
  autocmd FileType cs setlocal tabstop=4
  autocmd FileType cs setlocal shiftwidth=4
  autocmd FileType cs setlocal softtabstop=4
  autocmd FileType cs setlocal expandtab
  autocmd FileType cs setlocal autoindent
  autocmd FileType cs setlocal smartindent
]]

-- Setup lazy.nvim
require("lazy").setup("plugins")
require("vim_settings")

