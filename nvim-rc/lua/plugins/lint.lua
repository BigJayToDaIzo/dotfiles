return {
	-- nvim-lint
	{
		"mfussenegger/nvim-lint",
		config = function()
			-- add them below in mason-nvim-lint ensure_installed table
			require("lint").linters_by_ft = {}
		end,
	},
	-- mason-nvim-lint
	{
		"rshkarin/mason-nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
		opts = {
			ensure_installed = {
				"bacon",
				"vale",
			},
			automatic_installation = true,
		},
	},
}
