-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Turn off paste mode when leaving insert (haaaayted it)
--
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- Fix autoformat absolutely WRECKING my Liquid
-- vim.g.autoformat = false --globally
-- vim.b.autoformat = false --buffer-local
vim.opt.textwidth = 80
vim.opt.cc = "81"
vim.opt.formatoptions = "tcqw"