return {
	-- Notifications
	-- :h nvim-notify.txt
	-- VERY sensible defaults
	"rcarriga/nvim-notify",
	config = function()
		-- point vims notification engine at plugin
		vim.notify = require("notify")
	end,
}
