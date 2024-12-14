return {
	-- nvim-cmp all day
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- "neovim/nvim-lspconfig",
			-- "hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			-- "hrsh7th/cmp-path",
			-- "hrsh7th/cmp-cmdline",
			-- "L3MON4D3/LuaSnip",
			-- "saadparwziz1/cmp_luasnip",
		},
		-- opts table y u no werk 4 me? :despair:
		config = function()
			local cmp = require("cmp")
			require("cmp").setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body) -- native for the waybacks
					end,
					--REQUIRED YO - its the heart of the operation!
					-- require("luasnip").lsp_expand(args.body)
				},
				window = {},
				mapping = cmp.mapping.preset.insert({}),
				-- why are there TWO sources tables here?
				sources = cmp.config.sources({}, {
					{ name = "buffer" },
				}),
				--git source "petertriho/cmp-git" opts = {},
			})
		end,
	},
	-- completion engine choice time
	-- luasnips? see docs for other options
	-- Teej recommends :h ins-completion before caving to tabs!
	{
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	-- SOURCES UP NEXT
	-- keyword len 5 on buffer to slow it way down
	-- max_item_count for busy completion sources
	-- FORMATTING ? LSPKIND? <<LOW>> priority
	-- EXPERIMENTAL ghost text play
}
