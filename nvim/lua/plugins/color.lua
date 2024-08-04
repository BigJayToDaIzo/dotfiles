return {
  {
    -- Gorgeous color picker right in the terminal
    -- :Ccc<C-d> to get started!
    "uga-rosa/ccc.nvim",
    config = function()
      require'ccc'.setup()
    end,
  },
  {
    -- Add another color based plugin here, or abstract and name it.
    -- You choose!
  },
}
