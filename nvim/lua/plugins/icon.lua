return {
	"ziontee113/icon-picker.nvim",
	dependencies = {
		"stevearc/dressing.nvim",
		opts = {},
	},
	config = function()
		require("icon-picker").setup({ disable_legacy_commands = true })
		local opts =
			vim.keymap.set("n", "<leader>ip", "<cmd>IconPickerNormal<cr>", { noremap = true, desc = "Icon Picker" })
		vim.keymap.set("n", "<leader>iy", "<cmd>IconPickerYank<cr>", { noremap = true, desc = "Icon Yanker" })
		vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", { noremap = true, desc = "Icon Inserter" })
	end,
}
