return {
	"catppuccin/nvim",
	lazy = false,
	enable = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		-- vim.cmd.colorscheme 'catppuccin'
		-- vim.cmd.colorscheme 'catppuccin-latte'
		-- vim.cmd.colorscheme("catppuccin-frappe")
		vim.cmd.colorscheme("catppuccin-macchiato")
		-- vim.cmd.colorscheme 'catppuccin-mocha'
	end,
}
