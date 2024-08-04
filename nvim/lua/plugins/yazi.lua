return {
  -- NOTE: Welcome to my FAVORITE (and only) yazi-nvim plugin
  -- I invite you to join me using yazi as a file tree.  It's like magic 
  -- and feels so vimly natural and buttery.  But as always.  Feel FREE
  -- to use Neo-tree or Netrw or whatever your heart desires here.
  -- I found it a soft place to land as a new learner.
	"mikavilpas/yazi.nvim",
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
    -- bugged for me, does weird things with icons
    -- This seems to be deeply nested in a popular tui library
    -- outside of the control of the plugin author, neovim
    -- or any muxer you may be using (tmux, zellij, etc)
    -- yazi_floating_window_winblend = 15,
    use_ya_for_events_reading = true,
    use_yazi_client_id_flag = true,
	},
}
