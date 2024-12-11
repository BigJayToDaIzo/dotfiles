return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- TODO SO MANY completion sources to play with!
		-- Copilot, crates, go packages and may more
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
		{
			"petertriho/cmp-git",
			dependencies = { "hrsh7th/nvim-cmp" },
			opts = {},
			init = function()
				table.insert(require("cmp").get_config().sources, { name = "git" })
			end,
		},
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			sorting = {
				priority_weight = 2,
				comparators = {
					require("copilot_cmp.comparators").prioritize,
				},
			},
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-y>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "copilot", group_index = 2 },
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "vsnip" },
				{ name = "git" },
				{ name = "lazydev" },
			}, {
				{ name = "buffer" },
			}),
		})
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

		-- Set up lspconfig.
		-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
		-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
		-- require("lspconfig")["<YOUR_LSP_SERVER>"].setup({
		-- 	capabilities = capabilities,
		-- })
	end,
}
