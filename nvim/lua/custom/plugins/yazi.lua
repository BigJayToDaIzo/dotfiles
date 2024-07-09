return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{
			"<leader>e",
			function()
				require("yazi").yazi()
			end,
			desc = "Open the file manager",
		},
		{
			-- Open in the current working directory
			"<leader>_",
			function()
				require("yazi").yazi(nil, vim.fn.getcwd())
			end,
			desc = "[E]xecute Yazi File Tree 󰙅 ",
		},
	},
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		floating_window_scaling_factor = 0.85,
		-- Apparentlyl broken
		-- yazi_floating_window_winblend = 20,
	},
}
