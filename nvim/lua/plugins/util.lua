-- consolidate small plugins here
--

return {
	--Codeium
	{
		"Exafunction/codeium.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},
	-- hardtime
	{
		"m4xshen/hardtime.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			max_count = 5,
			disable_mouse = false,
		},
	},
	-- precognition
	{
		"tris203/precognition.nvim",
		event = "VeryLazy",
		enabled = false,
		opts = {
			showBlankVirtLine = false,
			disable_fts = {},
		},
	},
	-- nerdy font glyph picker
	{
		"2KAbhishek/nerdy.nvim",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-telescope/telescope.nvim",
		},
		cmd = "Nerdy",
		keys = { { "<leader>i", "<cmd>Nerdy<cr>", desc = "Nerdy Icons 󰱵" } },
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
	-- Colorizer
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {},
	},
	-- Incline
	{
		"b0o/incline.nvim",
		config = function()
			local devicons = require("nvim-web-devicons")
			require("incline").setup({
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if filename == "" then
						filename = "[No Name]"
					end
					local ft_icon, ft_color = devicons.get_icon_color(filename)

					local function get_git_diff()
						local icons = { removed = " ", changed = " ", added = " " }
						local signs = vim.b[props.buf].gitsigns_status_dict
						local labels = {}
						if signs == nil then
							return labels
						end
						for name, icon in pairs(icons) do
							if tonumber(signs[name]) and signs[name] > 0 then
								table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
							end
						end
						if #labels > 0 then
							table.insert(labels, { "┊ " })
						end
						return labels
					end

					local function get_diagnostic_label()
						local icons = { error = " ", warn = " ", info = " ", hint = " " }
						local label = {}

						for severity, icon in pairs(icons) do
							local n = #vim.diagnostic.get(
								props.buf,
								{ severity = vim.diagnostic.severity[string.upper(severity)] }
							)
							if n > 0 then
								table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
							end
						end
						if #label > 0 then
							table.insert(label, { "┊ " })
						end
						return label
					end

					return {
						{ get_diagnostic_label() },
						{ get_git_diff() },
						{ (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
						{ filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
						{ "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
					}
				end,
			})
		end,
		event = "VeryLazy",
	},
	{
		"mcauley-penney/visual-whitespace.nvim",
		config = true,
	},
}
