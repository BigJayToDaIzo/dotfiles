return {
	{
		"mfussenegger/nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
			"rshkarin/mason-nvim-lint",
		},
		config = function()
			require("lint").linters_by_ft = {
				-- mason will install them for us when we put them here! :point_down:
				markdown = { "vale" },
				-- rust = { "rustlinter" }, -- on deck!
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	-- mason adapter for nvim-lint
	{
		"rshkarin/mason-nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
		config = function()
			require("mason-nvim-lint").setup({
				-- ensure installed here
				-- customize installs (and mason will grab binaries)
				-- up at the top in nvim-lint
				ensure_installed = { "luacheck", "selene", "ast-grep", "snyk", "trivy" },
				automatic_installation = true,
				quiet_mode = false,
				ignore_install = {},
			})
		end,
	},
	-- next adapter for lintness
}
