return {
	"nvim-neotest/neotest",
	event = "VeryLazy",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-plenary",
		"nvim-neotest/neotest-vim-test",
		{
			"fredrikaverpil/neotest-golang",
			dependencies = "leoluz/nvim-dap-go",
		},
	},

	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-golang"),
			},
		})
	end,
	keys = {
		{
			"<leader>ta",
			function()
				require("neotest").run.attach()
			end,
			desc = "[T]est [a]ttach",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "[T]est run [f]ile",
		},
		{
			"<leader>tA",
			function()
				require("neotest").run.run(vim.uv.cwd())
			end,
			desc = "[T]est [A]ll files",
		},
		{
			"<leader>tS",
			function()
				require("neotest").run.run({ suite = true })
			end,
			desc = "[T]est [S]uite",
		},
		{
			"<leader>tn",
			function()
				require("neotest").run.run()
			end,
			desc = "[t]est [n]earest",
		},
		{
			"<leader>tl",
			function()
				require("neotest").run.run_last()
			end,
			desc = "[T]est [l]ast",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "[T]est [s]ummary",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true, auto_close = true })
			end,
			desc = "[T]est [o]output",
		},
		{
			"<leader>tO",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "[T]est [O]output panel",
		},
		{
			"<leader>tt",
			function()
				require("neotest").run.stop()
			end,
			desc = "[T]est [t]erminate",
		},
		{
			"<leader>td",
			function()
				require("neotest").run.run({ suite = false, strategy = "dap" })
			end,
			desc = "Debug nearest test",
		},
	},
}
