return {
	{
		"zbirenbaum/copilot.lua",
		lazy = true,
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = { enabled = false },
				suggestion = { enabled = false },
			})
		end,
	},

	{
		"AndreM222/copilot-lualine",
		lazy = true,
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
		},
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
				end, { desc = "[C]opilot [C]hat" }),
				vim.keymap.set("x", "<leader>ce", "<cmd>CopilotChatExplain<CR>", { desc = "[E]xplain Selected Code" }),
				vim.keymap.set("x", "<leader>ct", "<cmd>CopilotChatTests<CR>", { desc = "Write [T]est for Code" }),
				vim.keymap.set("x", "<leader>cf", "<cmd>CopilotChatFix<CR>", { desc = "[F]ix Selected Code" }),
				vim.keymap.set(
					"x",
					"<leader>co",
					"<cmd>CopilotChatOptimize<CR>",
					{ desc = "[O]ptimize Selected Code" }
				),
				vim.keymap.set("x", "<leader>cd", "<cmd>CopilotChatDocs<CR>", { desc = "[D]ocument Selected Code" }),
				vim.keymap.set("n", "<leader>cx", "<cmd>CopilotChatFixDiagnostic<CR>", { desc = "Fix Tr[x]uble" }),
				vim.keymap.set("n", "<leader>cm", "<cmd>CopilotChatCommit<CR>", { desc = "Write [C]omit Msg" }),
			})
		end,
	},
}
