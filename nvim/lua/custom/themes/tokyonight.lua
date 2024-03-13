-- Change the name of the colorscheme plugin below, and then
-- change the command in the config to whatever the name of that colorscheme is
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
return { -- You can easily change to a different colorscheme.
  'folke/tokyonight.nvim',
  -- enabled = false,
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- Load the colorscheme here
    -- vim.cmd.colorscheme 'tokyonight'
    -- vim.cmd.colorscheme 'tokyonight-day'
    -- vim.cmd.colorscheme 'tokyonight-moon'
    -- vim.cmd.colorscheme 'tokyonight-night'
    -- vim.cmd.colorscheme 'tokyonight-storm'

    -- You can configure highlights by doing something like
    vim.cmd.hi 'Comment gui=none'
  end,
}
