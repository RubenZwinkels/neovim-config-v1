return {
  "echasnovski/mini.nvim",
  version = "*", -- Gebruik altijd de nieuwste versie
  config = function()
    -- Activeer alleen de modules die je nodig hebt
    require("mini.icons").setup() -- Als deze functie niet bestaat, kan dat de fout zijn
  end,
}
