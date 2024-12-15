return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		---@diagnostic disable-next-line missing-fields
		require("notify").setup({
			fps = 60,
		})
		vim.notify = require("notify")
		-- TODO: keymaps!
		vim.keymap.set("n", "<leader>x", function()
			---@diagnostic disable next-line
			vim.notify.dismiss()
		end, { desc = "Dismiss notifications" })
		vim.keymap.set("n", "<leader>sN", "<cmd>Telescope notify<CR>", { desc = "Show notifications" })
	end,
}
