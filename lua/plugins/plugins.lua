return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {
				fast_wrap = {
					map = "<C-e>", -- standaardtoets, je kunt dit aanpassen
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%>%]%)%}%,]]=],
					offset = 0,
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
			}
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require "notify"

			-- Basisinstellingen
			notify.setup {
				stages = "slide",              -- of "slide", "fade_in_slide_out", etc.
				timeout = 10000,
				background_colour = "#1e1e2e", -- transparante achtergrond
				render = "default",            -- andere optie: "compact", "minimal"
			}

			-- Maak notify de standaard notificatiefunctie
			vim.notify = notify

			vim.cmd [[
  highlight NotifyINFOBorder guifg=#7aa2f7 gui=bold
  highlight NotifyINFOTitle guifg=#7aa2f7 gui=bold
  highlight NotifyINFOIcon guifg=#7aa2f7 gui=bold

  highlight NotifyWARNBorder guifg=#e0af68 gui=bold
  highlight NotifyWARNTitle guifg=#e0af68 gui=bold
  highlight NotifyWARNIcon guifg=#e0af68 gui=bold

  highlight NotifyERRORBorder guifg=#ff5555 gui=bold
  highlight NotifyERRORTitle guifg=#ff5555 gui=bold
  highlight NotifyERRORIcon guifg=#ff5555 gui=bold

  highlight NotifyDEBUGBorder guifg=#9ece6a gui=bold
  highlight NotifyDEBUGTitle guifg=#9ece6a gui=bold
  highlight NotifyDEBUGIcon guifg=#9ece6a gui=bold

  highlight NotifyTRACEBorder guifg=#bb9af7 gui=bold
  highlight NotifyTRACETitle guifg=#bb9af7 gui=bold
  highlight NotifyTRACEIcon guifg=#bb9af7 gui=bold
]]
		end,
	},
}
