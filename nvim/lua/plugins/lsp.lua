return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			lspconfig = require("lspconfig")
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
			-- require("lspconfig").clangd.setup({
			-- 	capabilities = capabilities,
			-- 	..., -- other lspconfig configs
			-- })
		end,
	},
	-- lspkind
	{
		"onsails/lspkind.nvim",
	},
}
