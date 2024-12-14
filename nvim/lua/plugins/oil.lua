return {
  {
    "stevearc/oil.nvim",
    dependencies = {
      { "echasnovski/mini.icons", opts = {} },
    },
    vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open Oil" }),
    config = function()
      require("oil").setup({
        win_options = {
          signcolumn= "yes:2",
        },
        float = {
          padding = 5,
        },
      })
    end,
  },
  {
    "refractalize/oil-git-status.nvim",
    dependencies = {
      "stevearc/oil.nvim",
    },
    opts = {},

  },
}
