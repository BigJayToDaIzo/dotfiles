return {
  -- NOTE: Welcome to my FAVORITE (and only) yazi-nvim plugin
  -- I invite you to join me using yazi as a file tree.  It's like magic 
  -- and feels so vimly natural and buttery.  But as always.  Feel FREE
  -- to use Neo-tree or Netrw or whatever your heart desires here.
  -- I found it a soft place to land as a new learner.
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{
			"<leader>e",
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
	},
}
