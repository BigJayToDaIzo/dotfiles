return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      max_lines = 8,
      min_window_height = 10,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup{
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        auto_install = true,
        ignore_install = {},
        vim.filetype.add({ pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } }),
        -- Defaults in case we want to change without needing docs
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        modules = {},
      }
    end,
  }
}
