return {
	"stevearc/oil.nvim",
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
	},
	vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open Oil" }),
	config = function()
		require("oil").setup({
			float = {
				padding = 10,
			},
		})
	end,
}

