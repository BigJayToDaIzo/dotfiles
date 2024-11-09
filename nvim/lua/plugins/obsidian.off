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
					-- NOT in cloud
					name = "Personal",
					path = "~/Projects/personal/",
				},
				{
					-- IN cloud
					name = "Personal Neovim Config",
					path = "~/.config/nvim/",
					-- overrides = {},
				},
				-- {
				--  IN cloud
				-- 	name = "Personal Project Gock",
				-- 	path = "~/Projects/personal/gock/",
				-- 	strict = true,
				-- 	overrides = {},
				-- },
				{
					-- IN cloud
					name = "nvim-lightLGPL",
					path = "~/.config/nvim-lightLGP/",
				},
			},
			templates = {
				folder = "~/obsidian/templates",
				date_format = "%y-%m-%d-%a",
				time_format = "%H:%M",
			},
			-- More OPTS go here 🖣
			notes_subdir = "/notes",
			log_level = vim.log.levels.INFO,
			daily_notes = {
				folder = "/notes/dailies",
				default_tags = { "daily-notes" },
				-- TODO: explore note templates
				template = nil,
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			-- TODO: Add more mappings to <leader>o
			mappings = {
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				-- Open vault in app from buffer note
				["<leader>oa"] = {
					action = "<cmd>ObsidianOpen<cr>",
					opts = { desc = "Open Note In App 󰇷 " },
				},
				-- Picker of links in buffer
				["<leader>ob"] = {
					action = "<cmd>ObsidianBacklinks<cr>",
					opts = { desc = "Links Picker" },
				},
				-- Dailies picker
				["<leader>od"] = {
					action = "<cmd>ObsidianDailies<cr>",
					opts = { desc = "Dailies Picker" },
				},
				-- Link selection to note
				["<leader>ol"] = {
					action = "<cmd>ObsidianLink<cr>",
					opts = { desc = "Link Selection To Note" },
				},
				-- Insert template from picker under cursor
				["<leader>oM"] = {
					action = "<cmd>ObsidianTemplate<cr>",
					opts = { desc = "Insert Template Under Cursor" },
				},
				-- New /note in current workspace
				["<leader>on"] = {
					action = "<cmd>ObsidianNew<cr>",
					opts = { desc = "New /note" },
				},

				-- New from template
				["<leader>oN"] = {
					action = "<cmd>ObsidianNewFromTemplate<cr>",
					opts = { desc = "New /note From Template" },
				},
				-- Open tomorrows Note
				["<leader>oo"] = {
					action = "<cmd>ObsidianTomorrow<cr>",
					opts = { desc = "Open Tomorrow's Note" },
				},
				-- QuickSwitchNotes with ripgrep
				["<leader>oq"] = {
					action = "<cmd>ObsidianQuickSwitch<cr>",
					opts = { desc = "QuickSwitch Note" },
				},
				-- Open todays note
				["<leader>ot"] = {
					action = "<cmd>ObsidianToday<cr>",
					opts = { desc = "Open Today's Note" },
				},
				-- Search Obsidian
				["<leader>os"] = {
					action = "<cmd>ObsidianSearch<cr>",
					opts = { desc = "Search Obsidian" },
				},
				-- Get tags picker/sorter
				["<leader>oT"] = {
					action = "<cmd>ObsidianTags<cr>",
					opts = { desc = "Tags Picker" },
				},
				-- Toggle check-boxes.
				["<leader>ox"] = {
					action = function()
						require("obsidian").util.toggle_checkbox()
					end,
					opts = { desc = "Toggle Checkbox" },
				},
				-- Open Yesterday's note
				["<leader>oy"] = {
					action = "<cmd>ObsidianYesterday<cr>",
					opts = { desc = "Open Yesterday's Note" },
				},
				-- Smart action depending on context, either follow link or toggle checkbox.
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
				},
			},
			preferred_link_style = "markdown",
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
