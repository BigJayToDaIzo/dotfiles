return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},

			sections = {
				lualine_a = {
					{
						"mode",
						icons_enabled = true,
						icon = " ",
					},
				},

				lualine_b = {
					{
						"diagnostics",
						icon = " ",
						sources = { "nvim_workspace_diagnostic", "coc" },
						symbols = { error = " ", warn = " ", info = " ", hint = "🖕" },
					},
					{
						"filename",
						newfile_status = true,
						path = 4,
						symbols = {
							modified = "󰦒",
							readonly = " ",
							unnamed = "󱀶 ",
							newfile = " ",
						},
					},
					{
						"diff",
						icon = " ",
						symbols = { added = "󰐖 ", modified = "󰦓 ", removed = "󱂥 " },
					},
					{ "branch", icon = "" },
				},

				lualine_c = {
					"searchcount",
					"selectioncount",
				},

				lualine_x = {},

				lualine_y = {
					"copilot",
					"filetype",
					{
						"progress",
						icon = { "󰹹", align = "right" },
					},
					{
						"location",
						icon = { "󰍎", align = "right" },
					},
				},
				lualine_z = {
					{
						"datetime",
						icon = { "󱛡 ", align = "right" },
					},
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			-- Unlikely to need most people confuse buffers and tabs
			-- Tabs are window arrangements, not buffer organizers
			-- tablne = {},
			extensions = {
				"fzf",
				"lazy",
				"mason",
				"neo-tree",
				"nvim-dap-ui",
				"symbols-outline",
				"toggleterm",
				"trouble",
			},
		})
	end,

	-- Bubbles config for lualine
	-- Author: lokesh-krishna
	-- MIT license n shit
	--
	-- GREAT starter template to begin building out my own custom AF theme! 😏
	-- stylua: ignore
	-- local colors = {
	--   blue   = '#80a0ff',
	--   cyan   = '#79dac8',
	--   black  = '#080808',
	--   white  = '#c6c6c6',
	--   red    = '#ff5189',
	--   violet = '#d183e8',
	--   grey   = '#303030',
	-- }
	--
	-- local bubbles_theme = {
	--   normal = {
	--     a = { fg = colors.black, bg = colors.violet },
	--     b = { fg = colors.white, bg = colors.grey },
	--     c = { fg = colors.white },
	--   },
	--   insert = { a = { fg = colors.black, bg = colors.blue } },
	--   visual = { a = { fg = colors.black, bg = colors.cyan } },
	--   replace = { a = { fg = colors.black, bg = colors.red } },
	--
	--   inactive = {
	--     a = { fg = colors.white, bg = colors.blue },
	--     b = { fg = colors.white, bg = colors.black },
	--     c = { fg = colors.white },
	--   },
	-- }
}
