return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "echasnovski/mini.icons", version = false },
	},
	opts = {
		spec = {
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", group = "Copilot GTP-4  " },
			{ "<leader>i", group = "[I]con Picker ⛏ " },
			{ "<leader>e", group = "Yazi 󰇥 " },
			{ "<leader>n", group = "Noice  " },
			{ "<leader>t", group = "Todo  " },
			{ "<leader>p", group = "Precognition 👁️" },
			{ "<leader>s", group = "Search  " },
			{ "<leader>x", group = "Trouble  " },
		},
		keys = {
			scroll_down = "<c-j>",
			scroll_up = "<c-k>",
		},
	},
	-- set up LSP keybinds below d
	-- ["<leader>d"] = { name = "[D]ocument 🗎 ", _ = "which_key_ignore" },
	-- twf is r for?
	-- ["<leader>r"] = { name = "[R]ename  ", _ = "which_key_ignore" },
	-- this probably belongs below lsp setup too
	-- ["<leader>w"] = { name = "[W]orkspace 󱎃 ", _ = "which_key_ignore" },
}
