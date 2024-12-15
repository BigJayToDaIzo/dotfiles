return {
	-- Notifications
	-- :h nvim-notify.txt
	-- VERY sensible defaults
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		---@diagnostic disable next-line
		require("notify").setup({
			fps = 60,
		})
		-- point vims notification engine at plugin
		vim.notify = require("notify")
		-- Keybinds!
		vim.keymap.set("n", "<leader>x", function()
			---@diagnostic disable next-line
			vim.notify.dismiss()
		end, { desc = "Dismiss Notifications" })
		vim.keymap.set("n", "<leader>so", "<CMD>Telescope notify<CR>", { desc = "Search Notifications" })
	end,
}
