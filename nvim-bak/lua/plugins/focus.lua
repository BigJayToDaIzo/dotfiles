return {
	"nvim-focus/focus.nvim",
	version = false,
	config = function()
		-- TODO: Figure out how to pass these commands into Oil
		vim.keymap.set("n", "<leader>fe", "<Cmd>FocusEqualise<CR>", { desc = "FocusEqualiseGlobal" })
		vim.keymap.set("n", "<leader>fm", "<Cmd>FocusMaximise<CR>", { desc = "FocusMaximiseGlobal" })
		vim.keymap.set("n", "<leader>ft", "<Cmd>FocusDisable<CR><Cmd>FocusEnable<CR>", { desc = "FocusEnable" })
		vim.keymap.set("n", "<leader>fsu", "<Cmd>FocusSplitUp<CR>", { desc = "FocusSplitUp" })
		vim.keymap.set("n", "<leader>fsd", "<Cmd>FocusSplitDown<CR>", { desc = "FocusSplitDown" })
		vim.keymap.set("n", "<leader>fsl", "<Cmd>FocusSplitLeft<CR>", { desc = "FocusSplitLeft" })
		vim.keymap.set("n", "<leader>fsr", "<Cmd>FocusSplitRight<CR>", { desc = "FocusSplitRight" })
		vim.keymap.set("n", "<leader>fsn", "<Cmd>FocusSplitNicely<CR>", { desc = "FocusSplitNicely" })
		vim.keymap.set("n", "<leader>fwt", "<CMD>FocusToggleWindow<CR>", { desc = "FocusToggleWindow" })
		vim.keymap.set("n", "<leader>fbt", "<CMD>FocusToggleBuffer<CR>", { desc = "FocusToggleBuffer" })
		require("focus").setup({})
	end,
}
