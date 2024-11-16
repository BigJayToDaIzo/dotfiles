return {
	"stevearc/oil.nvim",
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
	},
	vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open Oil" }),
	config = function()
		require("oil").setup({
			keymaps = {
				-- override defaults to use focus plugin commands
				vim.keymap.set("n", "<C-s>", "<CMD>FocusSplitRight<CR>", { desc = "Focus Split Right" }),
				vim.keymap.set("n", "<C-v>", "<CMD>FocusSplitDown<CR>", { desc = "FloatSplitDown" }),
			},
			float = {
				padding = 10,
				preview_split = "below",
			},
		})
	end,
}
