return {
	-- neotest dawg
	-- HIGHLY experimental, may wipe
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("rustaceanvim.neotest"),
				},
			})
		end,
		keys = {
			{
				"<leader>ta",
				function()
					require("neotest").run.attach()
				end,
				desc = "Test Attach",
			},
			{
				"<leader>tf",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Test Run File",
			},
			{
				"<leader>tA",
				function()
					require("neotest").run.run(vim.uv.cwd())
				end,
				desc = "Test All Files",
			},
			{
				"<leader>tS",
				function()
					require("neotest").run.run({ suite = true })
				end,
				desc = "Test Suite",
			},
			{
				"<leader>tn",
				function()
					require("neotest").run.run()
				end,
				desc = "Test Nearest",
			},
			{
				"<leader>tl",
				function()
					require("neotest").run.run_last()
				end,
				desc = "Test Last",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Test Summary",
			},
			{
				"<leader>to",
				function()
					require("neotest").output.open({ enter = true, auto_close = true })
				end,
				desc = "Test Output",
			},
			{
				"<leader>tO",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Test Output Panel",
			},
			{
				"<leader>tt",
				function()
					require("neotest").run.stop()
				end,
				desc = "Test Terminate",
			},
			{
				"<leader>td",
				function()
					require("neotest").run.run({ strategy = "dap", suite = true })
				end,
				desc = "Debug Nearest Test",
			},
		},
	},
	{},
}
