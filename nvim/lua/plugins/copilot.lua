return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			-- defaults below, but you can see how configs
			-- can be further modified
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
			},
			copilot_node_command = "node",
			-- see docs for more info
			server_opts_overrieds = {},
		},
		config = function(opts)
			require("copilot").setup(opts)
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = {
			"zbirenbaum/copilot.lua",
		},
		opts = {},
	},
}
