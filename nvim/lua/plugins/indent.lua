return {
	-- tag = "v3.8.2", -- Check again afetr 3.8.3 which broke everything
	-- Indentation guides make code flow a little nicer in my eyes
	-- :h ibl<C-d>
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		local highlight = {
			"ProIshGreen",
			"SometimeYaGottaOrange",
			"ItStartTaStankPurp",
			"BoutaSpiralBlue",
			"BroWutUDoonOrange",
			"GettnNuddyGreen",
			"OnlyAMotherCldLvRed",
		}

		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "ProIshGreen", { fg = "#36B139" })
			vim.api.nvim_set_hl(0, "SometimeYaGottaOrange", { fg = "#E5C07B" })
			vim.api.nvim_set_hl(0, "ItStartTaStankPurp", { fg = "#C678DD" })
			vim.api.nvim_set_hl(0, "BoutaSpiralBlue", { fg = "#61AFEF" })
			vim.api.nvim_set_hl(0, "BroWutUDoonOrange", { fg = "#D19A66" })
			vim.api.nvim_set_hl(0, "GettnNuddyGreen", { fg = "#98C379" })
			vim.api.nvim_set_hl(0, "OnlyAMotherCldLvRed", { fg = "#FF182E" })
		end)
		vim.g.rainbow_delimiters = { highlight = highlight }
		require("ibl").setup({
			indent = {
				highlight = highlight,
				char = "┊",
			},
		})
		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
