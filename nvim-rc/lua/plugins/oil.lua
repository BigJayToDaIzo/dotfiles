return {
	{
		"stevearc/oil.nvim",
		dependencies = {
			{
				{ "echasnovski/mini.icons", opts = {} },
			},
		},
		vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open Oil" }),
		config = function()
			require("oil").setup({
				float = {
					padding = 10,
				},
				win_options = {
					signcolumn = "yes:2",
				},
			})
		end,
	},
	{
		"refractalize/oil-git-status.nvim",
		dependencies = { "stevearc/oil.nvim" },
		config = true,
	},
}
