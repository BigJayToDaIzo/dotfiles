return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>d", group = "🗠Diagnostics" },
			{ "<leader>g", group = " GitStuffs" },
			{ "<leader>gt", group = " Git Toggle" },
			{ "<leader>s", group = " SearchAScope" },
			{ "<leader>t", group = "󱉃 Testing" },
			{ "<leader>i", group = "󰢷 Icon Picker" },
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
