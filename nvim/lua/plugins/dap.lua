return {
	{
		"mfussenegger/nvim-dap",
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
				build = "TSUpdate",
			},
			"mfussenegger/nvim-dap",
		},
		opts = {},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},
}
