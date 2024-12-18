return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = { "habamax", "everforest", "eldritch", "mellow" },
			livePreview = true,
		})
	end,
}
