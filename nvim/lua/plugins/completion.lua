return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- TODO SO MANY completion sources to play with!
		-- Copilot, crates, go packages and may more
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		"rcarriga/cmp-dap",
		{
			"L3MON4D3/LuaSnip",
			event = "InsertEnter",
			build = "make install_jsregexp",
		},
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
		local luasnip = require("luasnip")
		cmp.setup({
			enabled = function()
				---@diagnostic disable-next-line: deprecated
				return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
			end,
			sorting = {
				priority_weight = 2,
				comparators = {
					require("copilot_cmp.comparators").prioritize,
				},
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({
								select = true,
							})
						end
					else
						fallback()
					end
				end),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},
			-- mapping = {
			-- 	["<C-b>"] = cmp.mapping.scroll_docs(-4),
			-- 	["<C-f>"] = cmp.mapping.scroll_docs(4),
			-- 	["<C-y>"] = cmp.mapping.complete(),
			-- 	["<C-e>"] = cmp.mapping.abort(),
			-- 	["<CR>"] = cmp.mapping.confirm({ select = true }),
			-- },
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
		cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
			sources = { { name = "dap" } },
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
	end,
}
