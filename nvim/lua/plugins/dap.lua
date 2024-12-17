return {
	-- nvim-dap
	{
		"mfussenegger/nvim-dap",
		dependencies = {},
		config = function()
			local dap = require("dap")
			-- require("dap").setup({})
			-- local _ = require("dap")
			-- dap.adapters.lua = {
			-- 	type = "executable",
			-- }
			-- TODO: keymaps for dap module, convert to keys = {}, ?
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Breakpoint" })
			vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Repl Open" })
			vim.keymap.set("n", "<leader>dC", dap.clear_breakpoints, { desc = "Debug: Clear All Breakpoints." })
			vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
			-- we haven't decided if we're using dap-ui yet
			-- vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })
			vim.keymap.set("n", "<F10>", dap.terminate, { desc = "Debug: Terminate Session." })
		end,
		-- TODO: keymaps for telescope module <leader>d group

		-- d is for debug and dap is for debug adapter protocol yo!
		vim.keymap.set("n", "<leader>dc", function()
			require("telescope").extensions.dap.commands()
		end, { desc = "Dap Commands" }),
		vim.keymap.set("n", "<leader>dC", function()
			require("telescope").extensions.dap.configurations()
		end, { desc = "Dap Configs" }),
		vim.keymap.set("n", "<leader>dl", function()
			require("telescope").extensions.dap.list_breakpoints()
		end, { desc = "Dap List BreakPts" }),
		vim.keymap.set("n", "<leader>dv", function()
			require("telescope").extensions.dap.variables()
		end, { desc = "Dap Vars" }),
		vim.keymap.set("n", "<leader>df", function()
			require("telescope").extensions.dap.frames()
		end, { desc = "Dap Frames" }),
	},
	-- dap ui!
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup({})
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	-- fidget
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	-- diagnostics meet debugger adapter protocol!
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			vim.diagnostic.config({ virtual_text = false })
			require("tiny-inline-diagnostic").setup({
				preset = "simple",
				options = {
					show_source = true,
					add_messages = true,
					multilines = true,
				},
			})
		end,
	},
	-- mason interface to dap
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			ensure_installed = { "stylua", "jq", "python", "delve" },
			automatic_installation = true,
			handlers = {
				function(config)
					-- all sources with no handler get passed here

					-- Keep original functionality
					require("mason-nvim-dap").default_setup(config)
				end,
				-- tweak out adapters here!
				-- python = function(config)
				-- 	config.adapters = {
				-- 		type = "executable",
				-- 		command = "/usr/bin/python3",
				-- 		args = {
				-- 			"-m",
				-- 			"debugpy.adapter",
				-- 		},
				-- 	}
				-- 	don't forget to give each adapter the default setup too! :point down:
				-- 	require("mason-nvim-dap").default_setup(config) -- don't forget this!
				-- end,
			},
		},
	},
	-- telescope interface to dap
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
