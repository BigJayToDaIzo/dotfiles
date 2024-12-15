return {
	{
		"stevearc/dressing.nvim",
		dependencies = {
			-- nvim-nui
			{
				"MunifTanjim/nui.nvim",
			},
		},
		-- very sensibe and bountiful options to tinker in below
		opts = {},
		config = function(opts)
			require("dressing").setup(opts)
		end,
	},
}
