return { -- Adds git related signs to the gutter, as well as utilities for managing changes
	{
		-- :h gitsigns.text
		-- :Gitsigns <C-d> takes you far!
		-- TODO: Set up keybinds for this one under <leader>g*
		-- TODO: Get statsbar git integration going
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				-- Options tweaked here!
				signs = {
					add = { text = "" },
					change = { text = "𝚫 " },
					delete = { text = "󱂥" },
					topdelete = { text = "‾" },
					changedelete = { text = " " },
					untracked = { text = "󰔧 " },
				},
				numhl = true,
				word_diff = false,
				-- On buffer attach (auto by default)
				on_attach = function(bufnr)
					local gitsigns = require("gitsigns")
					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end
					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c]", bang = true })
						else
							gitsigns.nav_hunk("next")
						end
					end)

					map("n", "[c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[c", bang = true })
						else
							gitsigns.nav_hunk("prev")
						end
					end)

					-- Actions!
					map("n", "<leader>gb", function()
						gitsigns.blame_line({ full = true })
					end, { desc = "n_Gitsigns Blame Line" })
					map("n", "<leader>gd", gitsigns.diffthis, { desc = "n_Gitsigns Diff" })
					map("n", "<leader>gD", function()
						gitsigns.diffthis("~")
					end, { desc = "n_Gitsigns Diff~" })
					map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "n_Gitsigns Preview Hunk" })
					map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "n_Gitsigns Reset Hunk" })
					map("v", "<leader>gr", function()
						gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "v_Gitsigns Reset Hunk" })
					map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "n_Gitsigns Reset Buffer" })
					map(
						{ "o", "x" },
						"<leader>gR",
						":<C-U>Gitsigns select_hunk<CR>",
						{ desc = "ox_Gitsigns Select Hunk" }
					)
					map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "n_Gitsigns Stage Hunk" })
					map("v", "<leader>gs", function()
						gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "v_Gitsigns Stage Hunk" })
					map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "n_Gitsigns Stage Buffer" })
					map(
						"n",
						"<leader>gtc",
						gitsigns.toggle_current_line_blame,
						{ desc = "n_Gitsigns Toggle CurLine Blame" }
					)
					map("n", "<leader>gtd", gitsigns.toggle_deleted, { desc = "n_Gitsigns Toggle Deleted" })
					map("n", "<leader>gtl", gitsigns.toggle_linehl, { desc = "n_Gitsigns Toggle LineHL" })
					map("n", "<leader>gtn", gitsigns.toggle_numhl, { desc = "n_Gitsigns Toggle NumHL" })
					map("n", "<leader>gts", gitsigns.toggle_signs, { desc = "n_Gitsigns Toggle Gutter Signs" })
					map("n", "<leader>gtw", gitsigns.toggle_word_diff, { desc = "n_Git Toggle Diff" })
					map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "n_Git Undo Stage Hunk" })
				end,
			})
		end,
	},
	{
		-- NOTE: As always, use what you want.  But LazyGit is worth a try!
		-- LOADS of configuration options.  I like vanilla
		-- :h lazygit<C-d>
		-- :LazyG<C-d>
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit" },
		},
	},
}
