return {
	{ -- Add indentation guides even on blank lines
		-- Enable `lukas-reineke/indent-blankline.nvim`
		"lukas-reineke/indent-blankline.nvim",
		-- See `:help ibl`
		main = "ibl",
		config = function()
			require("ibl").setup({
				enabled = true,
			})
		end,
	},
}
