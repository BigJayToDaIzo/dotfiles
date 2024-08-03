return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"javascript",
					"typescript",
					"tsx",
					"lua",
					"python",
					"rust",
					"c_sharp",
					"markdown",
					"markdown_inline",
					"go",
					"gowork",
					"gomod",
					"gosum",
					"comment",
					"templ",
					"gleam",
				},
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				sync_install = false,
				ignore_install = {},
				modules = {
					"nvim-treesitter/nvim-treesitter-textobjects",
				},
				vim.filetype.add({ pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } }),
			})
		end,
		-- There are additional nvim-treesitter modules that you can use to interact
		-- with nvim-treesitter. You should go explore a few and see what interests you:
		-- Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
		-- Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-context").setup({
				max_lines = 5,
				min_window_height = 8,
			})
		end,
	},
}
