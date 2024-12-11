-- FZF URR THNG MFR FLFR
return {
	-- :h telescope || :Telescope <C-d> will take you far! The or condition is a secret!
	-- kh telescope.defaults.mappings
	-- <C-/> brings up keybinds inside telescope!
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		-- :NvimWebDevIconsHiTest for register funsies!
		{ "nvim-tree/nvim-web-devicons" },
		{
			-- :h telescope-fzf-native
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{
			-- Telescope takes over dap here?  May be undesirable behavior
			"nvim-telescope/telescope-dap.nvim",
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				-- Default configuration for telescope goes here:
				-- config_key = value,
				mappings = {
					i = {
						-- map actions.which_key to <C-h> (default: <C-/>)
						-- actions.which_key shows the mappings for your picker,
						-- e.g. git_{create, delete, ...}_branch for the git_branches picker
						-- ["<C-h>"] = "which_key"
					},
				},
			},
			pickers = {
				-- Default configuration for builtin pickers goes here:
				-- picker_name = {
				--   picker_config_key = value,
				--   ...
				-- }
				-- Now the picker_config_key will be applied every time you call this
				-- builtin picker
			},
			extensions = {
				-- Your extension configuration goes here:
				-- extension_name = {
				--   extension_config_key = value,
				-- }
				-- please take a look at the readme of the extension you want to configure
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				fzf = {
					-- Has sensible defaults this table is for show whur set different
				},
			},
		})
		pcall(require("telescope").load_extension, "ui-select")
		-- Trial telescope extension install
		pcall(require("telescope").load_extension, "rest")
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "dap")
		local builtin = require("telescope.builtin")

		-- TODO: Add those sweet telescope dap extension binds!
		vim.keymap.set("n", "<leader><leader>", function()
			builtin.buffers(require("telescope.themes").get_dropdown({
				previewer = true,
			}))
		end, { desc = "Search Buffers" })
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "FZF Current Buffer" })
		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "Search Open Files" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Search Neovim Files" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Select Telescope" })
		vim.keymap.set("n", "<leader>su", "<cmd>Telescope undo<cr>", { desc = "Search Undo History" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search Current Word" })
		-- Shortcut for searching your neovim configuration files
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume Last Search" })
	end,
}
