return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>Tl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions",
		},
		{
			"<leader>TL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List",
		},
		{
			"<leader>Ts",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols",
		},
		{
			"<leader>Tt",
			"<cmd>TodoTrouble<cr>",
			desc = "TodoTrouble",
		},
		{
			"<leader>TQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List",
		},
		{
			"<leader>Tx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics",
		},
		{
			"<leader>TX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics",
		},
	},
}
