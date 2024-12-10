return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	--LSP
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"ast_grep",
				"bashls",
				"bufls",
				"docker_compose_language_service",
				"dockerls",
				"eslint",
				"gitlab_ci_ls",
				"golangci_lint_ls",
				"gopls",
				"harper_ls",
				"jsonls",
				"templ",
				"html",
				"lua_ls",
				"pbls",
				"rust_analyzer",
				"yamlls",
			},
			automatic_installation = true,
		},
	},
	--FORMAT (Conform?)
	{
		"stevearc/conform.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			{
				"zapling/mason-conform.nvim",
				opts = {},
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt", lsp_format = "fallback" },
				go = { "gofumpt", "goimports", "goimports-reviser", "golines" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	--LINT
	{
		"mfussenegger/nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
			{
				"rshkarin/mason-nvim-lint",
			},
		},
		opts = {},
	},
	--DAP
}
