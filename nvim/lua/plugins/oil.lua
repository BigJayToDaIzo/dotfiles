return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
	},
	config = function()
		require("oil").setup({})
	end,
	vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open Oil FileTree" }),
}
