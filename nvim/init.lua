-- Set vim options in /lua/vimopts.lua
require("vimopts")
-- Set keymaps in /lua/keymaps.lua
require("keymaps")
-- Set Basic Autocommands here
-- See `:help lua-guide-autocommands`
-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
-- No need to modify anything in Install 'lazy.nvim' block. All configuration takes place below
-- [[ Configure and install plugins ]]
-- To check the current status of your plugins, run
-- :Lazy
-- You can press `?` in this menu for help. Use `:q` to close the window
-- To update plugins, you can run
-- :Lazy update
require("lazy").setup({
	{ event = "VimEnter", import = "custom.themes" },
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	-- Use `opts = {}` to force a plugin to be loaded.
	-- This is equivalent to:
	-- require('Comment').setup({})
	require("kickstart.plugins.debug"),
	require("kickstart.plugins.indent_line"),
	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	{ import = "custom.plugins" },
})
