return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = false,
					auto_refresh = true,
				},
				suggestion = {
					enabled = false,
					auto_trigger = true,
				},
			})
		end,
	},
	{
		"AndreM222/copilot-lualine",
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
		},
		opts = {},
		config = function()
			require("CopilotChat").setup({
				window = {
					layout = "float",
					relative = "cursor",
					width = 1,
					height = 0.4,
					row = 1,
				},
				-- Copilot keybinds
				vim.keymap.set("n", "<leader>cc", function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
					end
				end, { desc = "Copilot Chat" }),
				vim.keymap.set("x", "<leader>ce", "<cmd>CopilotChatExplain<CR>", { desc = "Explain Selected Code" }),
				vim.keymap.set("x", "<leader>ct", "<cmd>CopilotChatTests<CR>", { desc = "Write Test for Code" }),
				vim.keymap.set("x", "<leader>cf", "<cmd>CopilotChatFix<CR>", { desc = "Fix Selected Code" }),
				vim.keymap.set("x", "<leader>co", "<cmd>CopilotChatOptimize<CR>", { desc = "Optimize Selected Code" }),
				vim.keymap.set("x", "<leader>cd", "<cmd>CopilotChatDocs<CR>", { desc = "Document Selected Code" }),
				vim.keymap.set("n", "<leader>cx", "<cmd>CopilotChatFixDiagnostic<CR>", { desc = "Fix Trouble" }),
				vim.keymap.set("n", "<leader>cm", "<cmd>CopilotChatCommit<CR>", { desc = "Write Commit Msg" }),
			})
		end,
	},
}
