return {
	-- :h oil<C-d>
	-- Navigate the file tree like a text file in a buffer!
	"stevearc/oil.nvim",
	opts = {},
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
	},
	config = function()
		require("oil").setup({
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
		})
	end,
	vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open Oil FileTree" }),
}
