-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Diagnostic keymaps
-- vim.keymap.set("n", "[d", function()
-- 	vim.diagnostic.jump({ count = 1 })
-- end, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Go to next [D]iagnostic message" })
-- vim.keymap.set('n', '<leader>x', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- turn off Ctrl-Z quit cuz I hate it
vim.keymap.set("n", "<C-z>", "<Nop>")

-- Precognition binds
vim.keymap.set("n", "<leader>pt", "<cmd>lua require('precognition').toggle()<cr>", { desc = "[P]recognition [T]oggle" })

-- Folke Noice keymaps <leader>n on which-key
vim.keymap.set("n", "<leader>nh", "<cmd>Noice<cr>", { desc = "[N]oice [H]isory" })
vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<cr>", { desc = "[N]oice [L]ast" })
vim.keymap.set("n", "<leader>nx", "<cmd>Noice dismiss<cr>", { desc = "[N]oice Di[x]miss" })
vim.keymap.set("n", "<leader>nr", "<cmd>Noice errors<cr>", { desc = "[N]oice [E]rrors" })
vim.keymap.set("n", "<leader>nd", "<cmd>Noice disable<cr>", { desc = "[N]oice [D]isable" })
vim.keymap.set("n", "<leader>ne", "<cmd>Noice enable<cr>", { desc = "[N]oice [E]nable" })
vim.keymap.set("n", "<leader>ns", "<cmd>Noice stats<cr>", { desc = "[N]oice [S]tats" })
vim.keymap.set("n", "<leader>nt", "<cmd>Noice telescope<cr>", { desc = "[N]oice [ ]" })

-- Buffer based keymaps
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>", { desc = "[C]lose [B]buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bn<CR>", { desc = "[N]ext [B]buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bp<CR>", { desc = "[P]revious [B]buffer" })
vim.keymap.set("n", "<leader>br", "<cmd>BufferLineMoveNext<CR>", { desc = "[B]buffer Move [R]ight" })
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineMovePrev<CR>", { desc = "[B]buffer Move [L]eft" })
vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "[B]buffer Close [O]thers" })
vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<M-h>", "<cmd>BufferLineMovePrev<cr>")
vim.keymap.set("n", "<M-l>", "<cmd>BufferLineMoveNext<cr>")

-- folke/todo-comments.nvim uses <leader>o* maps to operate
vim.keymap.set("n", "<leader>ox", "<cmd>TodoTrouble<CR>", { desc = "Toggle T[o]do Tr[x]uble" })
vim.keymap.set("n", "<leader>ot", "<cmd>TodoTelescope<CR>", { desc = "Open T[o]do [T]elescope" })
vim.keymap.set("n", "<leader>o[", function()
	require("todo-comments").jump_prev()
end, { desc = "Go to previous T[o]do" })
vim.keymap.set("n", "<leader>o]", function()
	require("todo-comments").jump_next()
end, { desc = "Go to next T[o]do" })

-- folke/trouble.vim uses <leader>x* maps to operate
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle [T]rouble" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", { desc = "Toggle [T]rouble [Q]uickfix" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Toggle [T]rouble [L]oclist" })
vim.keymap.set("n", "<leader>xR", "<cmd>Trouble lsp_references toggle<cr>", { desc = "Toggle [T]rouble [R]eferences" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<M-Space>", "<cmd>WhichKey<CR>", { desc = "Open WhichKey menu" })
--Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
