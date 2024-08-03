return {
  {
    -- TODO: Does treesitter get a keychord? <leader>t*
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    -- all modules must be explicitly enabled
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "angular",
          "bash",
          "c",
          "c_sharp",
          "cmake",
          "comment",
          "cpp",
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
          "regex",
          "ruby",
          "rust",
          "scss",
          "templ",
          "toml",
          "typescript",
          "vim",
          "xml",
          "yaml",
        },
        -- sync_install = false,
        -- auto_install = true,
        -- ignore_install = { "javascript" },
        -- modules = { },
        })
    end,
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
