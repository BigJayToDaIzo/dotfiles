return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			width = 90,
		},
		plugins = {
			options = {
				laststatus = 3,
			},
			gitsigns = { enabled = true },
			todo = { enabled = true },
			wezterm = {
				enabled = true,
				font = "20",
			},
		},
	},
	keys = {
		{ "<leader>z", "<cmd>ZenMode<CR>", desc = "󰢄 Zen Mode" },
	},
}
