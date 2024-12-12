return {
	-- FIX, TODO, HACK, NOTE, WARN, PERF, TEST
	"folke/todo-comments.nvim",
	event = "VeryLazy",
	-- FIX:
	-- TODO:
	-- HACK:
	-- NOTE:
	-- WARN:
	-- PERF:
	-- TEST:
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		keywords = {
			TEST = { icon = "󱈬" },
		},
	},
	keys = {},
}
