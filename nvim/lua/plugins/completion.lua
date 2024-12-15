return {
	-- nvim-cmp all day
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwziz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			{
				"petertriho/cmp-git",
				dependencies = {
					"hrsh7th/nvim-cmp",
				},
				opts = {},
				init = function()
					table.insert(require("cmp").get_config().sources, { name = "git" })
				end,
			},
		},
		-- opts table y u no werk 4 me? :despair:
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			require("cmp").setup({
				snippet = {
					-- completion engine choice time
					-- luasnips? see docs for other options
					--REQUIRED YO - its the heart of the operation!
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
						-- vim.snippet.expand(args.body) -- native for the waybacks
						-- benched for luasnip
					end,
				},
				window = {},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.close(),
					["<C-y>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
				}),
				-- config points for sources begin at keyword_length
				-- priority = 100
				-- max_item_count = 2
				-- keyword_length = 5 --for buffer
				-- cuz probably the LAST one you'd be using amirite?
				-- SOURCES UP NEXT
				-- why are there TWO sources tables here?
				sources = cmp.config.sources({
					-- TODO: confirm works
					{ name = "copilot" },
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					{ name = "git" },
					{ name = "luasnip" },
					-- TODO: confirm works
					{ name = "path" },
					{ name = "cmdline" },
				}, {
					{ name = "buffer", keyword_length = 5 },
				}),
				formatting = {
					format = lspkind.cmp_format({
						with_text = true,
						menu = {
							copilot = "[]",
							buffer = "[buf]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[api]",
							path = "[path]",
							luasnip = "[snip]",
							git = "[git]",
							-- gh_issues = "[shu]",
						},
					}),
				},
				experimental = {
					native_menu = false,
					ghost_text = true,
				},
			})
			-- GIT TIEM
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" },
				}, {
					{ name = "buffer" },
				}),
			})
			require("cmp_git").setup()
			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})

			-- set up lspconfig?
			-- this seems to be working out of the box presently
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
			-- require("lspconfig")["<YOUR_LSP_SERVER>"].setup({
			-- 	capabilities = capabilities,
			-- })
		end,
	},
	-- Teej recommends :h ins-completion before caving to tabs!
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
		},
	},
}
