return {
	"folke/zen-mode.nvim",
	config = function()
		vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle ZenMode" })
	end,
}
