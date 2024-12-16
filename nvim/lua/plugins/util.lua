-- consolidate small plugins here
--

return {
	{
		"tris203/precognition.nvim",
		event = "VeryLazy",
		opts = {},
	},
	-- nerdy font glyph picker
	{
		"2KAbhishek/nerdy.nvim",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-telescope/telescope.nvim",
		},
		cmd = "Nerdy",
	},
	-- Notify
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			---@diagnostic disable-next-line missing-fields
			require("notify").setup({
				fps = 60,
			})
			vim.notify = require("notify")
			-- TODO: keymaps!
			vim.keymap.set("n", "<leader>x", function()
				---@diagnostic disable next-line
				vim.notify.dismiss()
			end, { desc = "Dismiss notifications" })
			vim.keymap.set("n", "<leader>sN", "<cmd>Telescope notify<CR>", { desc = "Show notifications" })
		end,
	},
	-- Flash
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
	},
	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			-- defaults below, but you can see how configs
			-- can be further modified
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
			},
			copilot_node_command = "node",
			-- see docs for more info
			server_opts_overrieds = {},
		},
		config = function(opts)
			require("copilot").setup(opts)
		end,
	},
	-- Copilot completion source
	{
		"zbirenbaum/copilot-cmp",
		dependencies = {
			"zbirenbaum/copilot.lua",
		},
		opts = {},
	},
	-- TODO
	{
		-- TODO:
		-- HACK:
		-- WARN:
		-- PERF:
		-- NOTE:
		-- TEST:
		-- FIX:

		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			keywords = {
				TEST = { icon = "󰤒" },
			},
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	-- Indent
	{
		"lukas-reineke/indent-blankline.nvim",

		main = "ibl",
		config = function()
			local highlight = {
				"ProIshGreen",
				"SometimeYaGottaOrange",
				"ItStartTaStankPurp",
				"BoutaSpiralBlue",
				"BroWutUDoonOrange",
				"GettnNuddyGreen",
				"OnlyAMotherCldLvRed",
			}

			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "ProIshGreen", { fg = "#36B139" })
				vim.api.nvim_set_hl(0, "SometimeYaGottaOrange", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "ItStartTaStankPurp", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "BoutaSpiralBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "BroWutUDoonOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "GettnNuddyGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "OnlyAMotherCldLvRed", { fg = "#FF182E" })
			end)
			vim.g.rainbow_delimiters = { highlight = highlight }
			require("ibl").setup({
				indent = {
					highlight = highlight,
					char = "┊",
				},
			})
			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
	-- autopair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
}
