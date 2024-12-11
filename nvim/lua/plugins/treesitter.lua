return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"angular",
				"bash",
				"c",
				"c_sharp",
				"cmake",
				"comment",
				"diff",
				"fish",
				"gitcommit",
				"gitignore",
				"go",
				"gotmpl",
				"html",
				"http",
				"kdl",
				"lua",
				"luadoc",
				"luau",
				"markdown",
				"markdown_inline",
				"ninja",
				"python",
				"query",
				"regex",
				"ruby",
				"rust",
				"scss",
				"templ",
				"toml",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		},
		config = function(opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = {
			enable = true,
			multiwindow = true,
			max_lines = 5,
			min_window_height = 20,
		},
	},
	-- {
	--   'nvim-treesitter/nvim-treesitter-textobjects',
	--   dependencies = {
	--     'nvim-treesitter/nvim-treesitter',
	--   },
	--   opts = {
	--
	--   },
	-- },
}
