return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				config = function()
					require("notify").setup({
						timeout = 2500,
						render = "compact",
					})
				end,
			},
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					lsp_doc_border = false,
				},
				cmdline = {
					enabled = true,
					-- view = "cmdline",
					-- view = "cmdline_popup", -- default
					opts = {},
				},
			})
		end,
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o", -- Only in operator-pending mode
				function()
					require("flash").remote()
				end, -- Flash remote
				desc = "Remote Flash",
			},
			{
				"R",
				mode = "o", -- Only in operator-pending mode
				function()
					require("flash").treesitter_remote()
				end, -- Flash remote
				desc = "Remote Flash Treesitter",
			},
			{
				"r",
				mode = "v", -- Only in visual mode
				function()
					require("flash").remote()
				end, -- Flash remote
				desc = "Remote Flash",
			},
			{
				"<C-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
}
