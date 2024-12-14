return {
	{
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			lspconfig = require("lspconfig")
		end,
	},
}
