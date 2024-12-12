return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
			},
			{
				"BurntSushi/ripgrep",
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		opts = {
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		},
		config = function(opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")
			local builtin = require("telescope.builtin")
			-- TODO Telescope keybinds here!
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
			vim.keymap.set("n", "<leader>st", builtin.treesitter, { desc = "Search Treesitter" })
			vim.keymap.set("n", "<leader>sT", "<cmd>TodoTelescope<cr>", { desc = "Search TODOS " })
			vim.keymap.set("n", "<leader>su", "<cmd>Telescope undo<cr>", { desc = "Search Undo History" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search Current Word" })
			-- Shortcut for searching your neovim configuration files
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume Last Search" })
		end,
		-- TODO map git functions in git.lua group <leader>g
		-- TODO map treesitter functions in treesitter.lua group <leader>s
		-- TODO map lsp functions in mason.lua <leader>d
		-- TODO replace quickfix bind with Telescope and add qf history bind
		-- TODO PREVIEWERS? Give qflist a try
	},
}
