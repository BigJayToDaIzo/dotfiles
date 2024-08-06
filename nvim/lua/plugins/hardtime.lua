return {
	-- Tries to help you improve your motion efficiency!
	"m4xshen/hardtime.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
	},
	opts = {
		max_count = 8,
		disable_mouse = false,
		allow_different_key = true,
		disabled_filetypes = { "lazy", "mason", "oil" },
	},
}
