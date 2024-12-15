return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {},
		config = function()
			-- require("dap").setup({})
			-- local _ = require("dap")
			-- dap.adapters.lua = {
			-- 	type = "executable",
			-- }
		end,
		-- TODO: keymaps for <leader>d group
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
