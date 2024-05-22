return {
	"akinsho/bufferline.nvim",
	-- version = "*",
	branch = "main",
	dependencies = "nvim-tree/nvim-web-devicons",
	enabled = true,

	config = function()
		require("bufferline").setup({
			-- highlights = require('catppuccin.groups.integrations.bufferline').get(),
			options = {
				-- ALL configuration takes place inside this options table
				-- Where helper functions are written remains unclear
				themable = true,
				indicator = {
					style = "underline",
				},
				buffer_close_icon = "󰅚 ",
				modified_icon = " ",
				close_icon = " ",
				left_trunc_marker = "󰳞 ",
				right_trunc_marker = "󰳠 ",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and "󰅚" or (e == "warning" and "" or "")
						s = s .. n .. sym
					end
					return s
				end,
				separator_style = "slant", --| "slope" | "thick" | "thin" | { 'any', 'any' },
				offsets = {
					{
						filetype = "neo-tree",
						text = "The Matrix is everywhere. -Morpheus",
						highlight = "Directory",
						separator = true,
						text_align = "left",
					},
				},
			},
			--STOP trying to put config down here, it ALL goes up there in options
		})
	end,
}
