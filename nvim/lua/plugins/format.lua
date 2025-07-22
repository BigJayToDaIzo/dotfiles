-- THIS WHERE WE FORMAT!
-- MASON HANDLES IT FROM HERE!
-- conform
return {
	-- {
	-- 	"zapling/mason-conform.nvim",
	-- 	dependencies = {
	-- 		"williamboman/mason.nvim",
	-- 		"stevearc/conform.nvim",
	-- 	},
	-- 	opts = {},
	-- 	config = function(opts)
	-- 		require("mason-conform").setup(opts)
	-- 	end,
	-- },
	{
		"stevearc/conform.nvim",
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt", lsp_format = "fallback" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
          gleam = { "gleam" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},
}
