return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      local Terminal = require('toggleterm.terminal').Terminal
      local horizTerm = Terminal:new {
        direction = 'horizontal',
        size = 10,
      }
      local horizTerm2 = Terminal:new {
        direction = 'horizontal',
        size = 10,
      }
      local vertTerm = Terminal:new {
        direction = 'vertical',
        size = 50,
      }
      local vertTerm2 = Terminal:new {
        direction = 'vertical',
        size = 50,
      }
      local lazygit = Terminal:new {
        cmd = 'lazygit',
        dir = 'git_dir',
        direction = 'float',
        float_opts = {
          border = 'single',
        },
      }
      function _lazygit_toggle()
        lazygit:toggle()
      end
      function _double_under_toggle()
        horizTerm:toggle()
        horizTerm2:toggle()
      end
      -- Why is this so narrow?
      function _double_aside_toggle()
        vertTerm:toggle()
        vertTerm2:toggle()
      end
      vim.api.nvim_set_keymap('n', '<leader>tg', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true, desc = 'Toggle Lazy[g]it [T]erm' })
      vim.api.nvim_set_keymap('n', '<leader>th', '<cmd>lua _double_under_toggle()<CR>', { noremap = true, desc = 'Spawn [H]oriz [T]erms' })
      vim.api.nvim_set_keymap('n', '<leader>tv', '<cmd>lua _double_aside_toggle()<CR>', { noremap = true, desc = 'Spawn [V]ert [T]erms' })
    end,
    -- End config
  },
  -- end toggleterm plugin installer
}
