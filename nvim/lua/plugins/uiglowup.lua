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
	-- colorful winsep
	{
		"nvim-zh/colorful-winsep.nvim",
		event = { "WinLeave" },
		config = function()
			require("colorful-winsep").setup({
				hi = {
					bg = "#16161e",
					fg = "#1f3442",
				},
			})
		end,
	},
}
