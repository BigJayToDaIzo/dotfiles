return {
	-- Notifications
	-- :h nvim-notify.txt
	-- VERY sensible defaults
	"rcarriga/nvim-notify",
	config = function()
		-- point vims notification engine at plugin
		vim.notify = require("notify")
		-- Keybind
		vim.keymap.set("n", "<leader>x", function()
			vim.notify.dismiss()
		end, { desc = "Dismiss Notifications" })
		vim.keymap.set("n", "<leader>so", "<CMD>Telescope notify<CR>", { desc = "[S]earch N[o]tifications" })
	end,
}
