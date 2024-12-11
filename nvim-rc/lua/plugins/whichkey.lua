return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>d", group = "🗠Diagnostics" },
			{ "<leader>s", group = " SearchAScope" },
			{ "<leader>t", group = "󱉃 Testing" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps",
		},
	},
}
