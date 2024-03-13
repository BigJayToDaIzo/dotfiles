return {
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {
    'baliestri/aura-theme',
    lazy = false,
    -- enable = true,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
      -- vim.cmd [[colorscheme aura-dark]]
      -- vim.cmd [[colorscheme aura-dark-soft-text]]
      -- vim.cmd [[colorscheme aura-soft-dark]]
      -- vim.cmd [[colorscheme aura-dark-soft-text]]
    end,
  },
}
