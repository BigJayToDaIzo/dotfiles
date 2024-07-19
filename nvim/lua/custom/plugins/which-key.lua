return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "echasnovski/mini.icons", version = false },
	},
	opts = {
		spec = {
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", mode = { "x", "n" }, group = "Copilot GTP-4  " },
			{ "<leader>d", group = "Diagnostics 	" },
			{ "<leader>e", group = "Yazi 󰇥 " },
			{ "<leader>i", group = "Icon Picker ⛏ " },
			{ "<leader>n", group = "Noice  " },
			{ "<leader>p", group = "Precognition 👁️" },
			{ "<leader>s", group = "Search  " },
			{ "<leader>t", group = "Todo  " },
			{ "<leader>x", group = "Trouble  " },
		},
	},
	-- set up LSP keybinds below d
	-- ["<leader>d"] = { name = "[D]ocument 🗎 ", _ = "which_key_ignore" },
	-- twf is r for?
	-- ["<leader>r"] = { name = "[R]ename  ", _ = "which_key_ignore" },
	-- this probably belongs below lsp setup too
	-- ["<leader>w"] = { name = "[W]orkspace 󱎃 ", _ = "which_key_ignore" },
}
