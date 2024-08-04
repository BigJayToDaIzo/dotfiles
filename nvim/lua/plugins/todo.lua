return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },

	--TODO Add those sweet Todo Keybinds!
	--
	-- NOTE :To<C-d> should cover it for now!
	--
	-- NOTE :TodoTelescope only recursively parses cwd!
	--
	-- all options
	--
	-- FIX fix me plz
	--
	-- FIXME fixme plz
	--
	-- BUG bug noplz
	--
	-- TODO todo plz
	--
	-- HACK hack plz
	--
	-- WARN warm plz
	--
	-- PERF perf plz
	--
	-- NOTE note plz
	--
	-- TEST test plz

	opts = {
		keywords = {
			FIX = { icon = "", color = "#f00b1b" },
		},
	},
}

-- FIX a thing that needs fixed
