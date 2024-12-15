return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- {
			-- 	"theHamsta/nvim-dap-virtual-text",
			-- 	dependencies = {
			-- 		{
			-- 			"nvim-treesitter/nvim-treesitter",
			-- 			build = "TSUpdate",
			-- 		},
			-- 		"mfussenegger/nvim-dap",
			-- 	},
			-- 	opts = {},
			-- },
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
		},
		config = function()
			-- DAP config!
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			-- DUNDAP config!
			-- Dap UI setup
			-- :h nvim-dap-ui
			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close
			-- DUNDap UI setup!

			-- Basic debugging keymaps, feel free to change to your liking!
			vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
			vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })
			vim.keymap.set("n", "<F10>", dap.terminate, { desc = "Debug: Terminate Session." })
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Breakpoint" })
			vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Repl Open" })
			vim.keymap.set("n", "<leader>dC", dap.clear_breakpoints, { desc = "Debug: Clear All Breakpoints." })
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		priority = 1000,
		config = function()
			vim.diagnostic.config({ virtual_text = false })
			require("tiny-inline-diagnostic").setup()
		end,
	},
}
