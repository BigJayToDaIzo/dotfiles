return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local obsidian = require("obsidian").setup({
			workspaces = {
				{
					name = "Personal",
					path = "~/Projects/personal/.obsidian",
				},
			},
			-- More OPTS go here 🖣
			notes_subdir = "notes",
			log_level = vim.log.levels.INFO,
			daily_notes = {
				folder = "notes/dailies",
				default_tags = { "daily-notes" },
				-- TODO: explore note templates
				template = nil,
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			mappings = {
				-- Toggle check-boxes.
				["<leader>ot"] = {
					action = function()
						require("obsidian").util.toggle_checkbox()
					end,
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
			-- Specify how to handle attachments.
			attachments = {
				-- The default folder to place images in via `:ObsidianPasteImg`.
				-- If this is a relative path it will be interpreted as relative to the vault root.
				-- You can always override this per image by passing a full path to the command instead of just a filename.
				img_folder = "assets/imgs", -- This is the default

				-- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
				---@return string
				img_name_func = function()
					-- Prefix image names with timestamp.
					return string.format("%s-", os.time())
				end,

				-- A function that determines the text to insert in the note when pasting an image.
				-- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
				-- This is the default implementation.
				---@param client obsidian.Client
				---@param path obsidian.Path the absolute path to the image file
				---@return string
				img_text_func = function(client, path)
					path = client:vault_relative_path(path) or path
					return string.format("![%s](%s)", path.name, path)
				end,
			},
		})
	end,
}
