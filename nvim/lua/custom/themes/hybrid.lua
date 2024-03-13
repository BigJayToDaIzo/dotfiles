return {
  'HoNamDuong/hybrid.nvim',
  lazy = false,
  priority = 1000,
  enable = false,
  opts = {
    mode = 'dark', -- dark, light, auto, or any theme name
    transparent = false, -- enable this to disable setting the background color
    disable = {
      background = false, -- disable setting the background color for all elements
      terminal_background = false, -- disable setting the background color for the terminal
    },
  },
  -- config = function()
  --   require('hybrid').setup {
  --     mode = 'dark', -- dark, light, auto, or any theme name
  --     transparent = false, -- enable this to disable setting the background color
  --     disable = {
  --       background = false, -- disable setting the background color for all elements
  --       terminal_background = false, -- disable setting the background color for the terminal
  --     },
  --     vim.cmd [[colorscheme hybrid]],
  --   }
  -- end,
}
