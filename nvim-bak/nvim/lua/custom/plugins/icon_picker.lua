return {
	"ziontee113/icon-picker.nvim",
	config = function()
		require("icon-picker").setup({ disable_legacy_commands = true })

		vim.keymap.set(
			"n",
			"<Leader>ia",
			"<cmd>IconPickerNormal<cr>",
			{ noremap = true, silent = true, desc = "Pick [A]ll" }
		)
		vim.keymap.set(
			"n",
			"<leader>ie",
			"<cmd>IconPickerNormal nerd_font_v3 emoji<cr>",
			{ noremap = true, silent = true, desc = "Pick NerdFonts & [E]moji" }
		)
		vim.keymap.set(
			"n",
			"<Leader>il",
			"<cmd>IconPickerNormal alt_font symbols<cr>",
			{ noremap = true, silent = true, desc = "Pick A[l]t Fonts & Symbols" }
		)
		vim.keymap.set(
			"n",
			"<leader>in",
			"<cmd>IconPickerNormal nerd_font_v3<cr>",
			{ noremap = true, silent = true, desc = "Pick [N]erdFonts" }
		)
		vim.keymap.set(
			"n",
			"<Leader>iy",
			"<cmd>IconPickerYank<cr>",
			{ noremap = true, silent = true, desc = "[Y]ank Icon into Register" }
		)
		vim.keymap.set(
			"i",
			"<C-z>",
			"<cmd>IconPickerInsert<cr>",
			{ noremap = true, silent = true, desc = "[I]nsert Icon" }
		)
	end,
}
