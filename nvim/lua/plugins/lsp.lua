return {
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- lua on deck!
			-- require("mason").setup()
			-- require("mason-lspconfig").setup()
			-- Use the cmdline :LspInstall <C-d> for the ezmode
			-- Fire the setup function for each module
			lspconfig.lua_ls.setup({ capabilities = capabilities }) -- tweak the settings here if you wanna!
			lspconfig.gleam.setup({ capabilities = capabilities }) -- tweak the settings here if you wanna!
		end,
	},
	-- completion module for lsp aka cmp-nvim-lsp
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
			-- require("lspconfig").clangd.setup({
			-- 	capabilities = capabilities,
			-- 	..., -- other lspconfig configs
			-- })
		end,
	},
	-- lspkind prettinformifies snippet window
	{
		"onsails/lspkind.nvim",
	},
	-- mason interface for lsp ezpz goodness
	-- {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	dependencies = {
	-- 		"williamboman/mason.nvim",
	-- 		"neovim/nvim-lspconfig",
	-- 	},
	-- 	config = function()
	-- 		require("mason-lspconfig").setup({
	-- 			-- rust analyzer backup to rustaceanvim
	-- 			ensure_installed = { "lua_ls", "rust_analyzer" },
	-- 			automatic_installation = true,
	-- 		})
	-- 	end,
	-- 	-- server setup is done back in lspconfig from here on out!
	-- 	-- just a little adapteroonie!
	-- },
}
