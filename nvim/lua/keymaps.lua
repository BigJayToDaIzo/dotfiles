-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- vim.keymap.set('n', '<leader>x', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Buffer based keymaps
vim.keymap.set('n', '<leader>bc', '<cmd>bd<CR>', { desc = '[C]lose [B]uffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>bn<CR>', { desc = '[N]ext [B]uffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bp<CR>', { desc = '[P]revious [B]uffer' })

-- folke/todo-comments.nvim uses <leader>t* maps to operate
vim.keymap.set('n', '<leader>ox', '<cmd>TodoTrouble<CR>', { desc = 'Toggle T[o]do Tr[x]uble' })
vim.keymap.set('n', '<leader>ot', '<cmd>TodoTelescope<CR>', { desc = 'Open T[o]do [T]elescope' })
vim.keymap.set('n', '<leader>o[', function()
  require('todo-comments').jump_prev()
end, { desc = 'Go to previous T[o]do' })
vim.keymap.set('n', '<leader>o]', function()
  require('todo-comments').jump_next()
end, { desc = 'Go to next T[o]do' })

-- Toggleterm kemaps
vim.keymap.set('n', '<leader>tv', ':ToggleTerm size=35 direction=vertical<CR>', { desc = 'Open [V]ertical terminal' })

-- folke/trouble.vim uses <leader>x* maps to operate
vim.keymap.set('n', '<leader>xx', function()
  require('trouble').toggle()
end, { desc = 'Toggle [T]rouble' })
vim.keymap.set('n', '<leader>xw', function()
  require('trouble').toggle 'workspace_diagnostics'
end, { desc = 'Toggle [T]rouble [W]orkspace' })
vim.keymap.set('n', '<leader>xd', function()
  require('trouble').toggle 'document_diagnostics'
end, { desc = 'Toggle [T]rouble [D]ocument' })
vim.keymap.set('n', '<leader>xq', function()
  require('trouble').toggle 'quickfix'
end, { desc = 'Toggle [T]rouble [Q]uickfix' })
vim.keymap.set('n', '<leader>xl', function()
  require('trouble').toggle 'loclist'
end, { desc = 'Toggle [T]rouble [L]oclist' })
vim.keymap.set('n', 'gR', function()
  require('trouble').toggle 'lsp_references'
end, { desc = 'Toggle [T]rouble [R]eferences' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
--TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle N[e]otree' })
vim.keymap.set('n', '<M-Space>', '<cmd>WhichKey<CR>', { desc = 'Open WhichKey menu' })
--Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
