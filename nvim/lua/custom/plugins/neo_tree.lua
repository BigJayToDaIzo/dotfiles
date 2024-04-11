return {
	"nvim-neo-tree/neo-tree.nvim",
	enable = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			window = {
				mappings = {
					--disable space to expand nodes
					--I want neovim to keep control of space as the leader key
					["<space>"] = "noop",
				},
			},
		},
	},
}
