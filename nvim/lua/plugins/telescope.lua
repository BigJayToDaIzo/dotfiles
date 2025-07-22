return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
			-- TODO: nvim-telescope/telescope-dap.nvim?
		},
		config = function()
			require("telescope").setup({
				defaults = {
					theme = {},
					layout_config = {},
					mappings = {
						-- TODO: enable once I install which_key
						i = {
							-- map actions.which_key to <C-h> (don't forget default <C-/> too!)
							["<C-h>"] = "which_key",
						},
					},
				},
				pickers = {
					-- Default config for builtin pickers go her:
					-- picker_name = {
					--  picker_config_key = value,
					-- ...
					-- },
					-- Bubba gump picker boat
					-- File pickers, vim pickers, lsp pickers, git pickers, treesitter pickers
					-- list pickers
					-- THEMES MUST BE configured here
					builtin = {
						theme = "ivy",
						winblend = 10,
						previewer = true,
					},
					current_buffer_fuzzy_find = {
						theme = "ivy",
						winblend = 10,
						previewer = true,
					},
					buffers = {
						theme = "ivy",
						winblend = 10,
						previewer = true,
					},
					live_grep = {
						theme = "ivy",
						winblend = 10,
						previewer = true,
					},
					oldfiles = {
						theme = "ivy",
						winblend = 10,
						previewer = true,
					},
					diagnostics = {
						theme = "ivy",
						winblend = 10,
						previewer = true,
					},
					find_files = {
						-- prompt_prefix = "!shid!",
						theme = "ivy",
						winblend = 10,
						previewer = true,
					},
					help_tags = {
						theme = "ivy",
						winblend = 10,
						previewer = true,
					},
					keymaps = {
						theme = "ivy",
						winblend = 10,
						previewer = true,
					},
					grep_string = {
						theme = "ivy",
						winblend = 10,
						previewer = true,
					},
					resume = {
						theme = "ivy",
						winblend = 10,
						previewer = true,
					},
				},
				extensions = {
					-- exetension config all up in this bih
					-- possible bolt ons telescope-emoji, yanky, telescope-undo
					-- telescope-dap(PRIORITY!),
					-- fzf = {
					-- 	fuzzy = true,
					-- 	override_generic_sorter = true,
					-- 	override_file_sorter = true,
					-- 	case_mode = "smart_case",
					-- },
				},
			})
			-- once setup, load the extension!
			-- require("telescope").load_extension("fzf")
			require("telescope").load_extension("dap")
			require("telescope").load_extension("notify")
			-- :h telescope.builtin
			local builtin = require("telescope.builtin")
			-- KEYBINDS YO
			vim.keymap.set("n", "<leader><leader>", function()
				builtin.buffers()
			end, { desc = "Search Buffers" })
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				builtin.current_buffer_fuzzy_find()
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
			-- TODO: Telescope DAP keybinds (do under <leader>d group!
		end,
	},
	{},
}
