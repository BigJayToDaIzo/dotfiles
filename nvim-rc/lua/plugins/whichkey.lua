return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>s", group = " SearchAScope" },
    },

  },
  keys = {
    {
      "<leader>?",
      function()
        require'which-key'.show({global = false})
      end,
      desc = "Buffer Local Keymaps",
    },
  },
}
