return {
	"mikavilpas/yazi.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	keys = {
    {
		"<leader>e",
		function()
			require("yazi").yazi()
		end,
		desc = "Open Yazi",
    },
	},
	opts = {
		open_for_directories = true,
	},
}
