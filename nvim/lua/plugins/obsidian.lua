return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = { "markdown", "md" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "Personal",
					path = "~/Projects/personal/.obsidian/",
				},
				-- {
				-- 	name = "Personal Project Gock",
				-- 	path = "~/Projects/personal/gock/.obsidian",
				-- 	strict = true,
				-- 	overrides = {},
				-- },
				{
					name = "nvim-lightLGPL",
					path = "~/.config/nvim-lightLGP/.obsidian",
				},
			},
			-- More OPTS go here 🖣
			notes_subdir = ".obsidian/notes",
			log_level = vim.log.levels.INFO,
			daily_notes = {
				folder = ".obsidian/notes/dailies",
				default_tags = { "daily-notes" },
				-- TODO: explore note templates
				template = nil,
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			mappings = {
				-- TODO: Add more mappings to <leader>o
				-- Toggle check-boxes.
				["<leader>ot"] = {
					action = function()
						require("obsidian").util.toggle_checkbox()
					end,
					opts = { desc = "Obsidian Toggle Checkbox" },
				},
			},
			preferred_link_style = "wiki",
			picker = {
				name = "telescope.nvim",
				-- Optional, configure PICKER key mappings here!
				note_mappings = {
					-- Create a new note from your query.
					new = "<C-x>",
					-- Insert a link to the selected note.
					insert_link = "<C-l>",
				},
				tag_mappings = {
					-- Add tag(s) to current note.
					tag_note = "<C-x>",
					-- Insert a tag at the current location.
					insert_tag = "<C-l>",
				},
			},
			search_max_liens = 1000,
			-- Optional, determines how certain commands open notes. The valid options are:
			-- 1. "current" (the default) - to always open in the current window
			-- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
			-- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
			open_notes_in = "vsplit",
		})
	end,
}
