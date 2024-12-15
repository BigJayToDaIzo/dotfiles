local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
	vim.cmd.RustLsp("codeAction")
end, { silent = false, buffer = bufnr, desc = "Rusty Code Action" })
vim.keymap.set("n", "K", function()
	vim.cmd.RustLsp({ "hover", "actions" })
end, { silent = false, buffer = bufnr })
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
-- 	command = "RustFmt",
-- })
