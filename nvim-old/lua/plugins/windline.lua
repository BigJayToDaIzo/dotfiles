return {
	"windwp/windline.nvim",
	config = function()
		require("windline").setup({
			require("wlsample.evil_line"),
			statuslines = {},
		})
	end,
}
