return {
	"echasnovski/mini.files",
	version = "*",
	config = function()
		require("mini.files").setup({
			mappings = {
				go_in = "L",
				go_in_plus = "l",
			},
		})
		vim.keymap.set("n", "<leader>e", "<CMD>lua require('mini.files').open()<CR>", { desc = "Open MiniFiles" })
		local map_split = function(buf_id, lhs, direction)
			local rhs = function()
				-- Make new window and set it as target
				local new_target_window
				vim.api.nvim_win_call(MiniFiles.get_explorer_state().target_window, function()
					vim.cmd(direction .. " split")
					new_target_window = vim.api.nvim_get_current_win()
				end)

				MiniFiles.set_target_window(new_target_window)
			end

			-- Adding `desc` will result into `show_help` entries
			local desc = "Split " .. direction
			vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				-- Tweak keys to your liking
				map_split(buf_id, "gs", "horizontal")
				map_split(buf_id, "gv", "vertical")
			end,
		})
		local set_mark = function(id, path, desc)
			MiniFiles.set_bookmark(id, path, { desc = desc })
		end
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesExplorerOpen",
			callback = function()
				set_mark("~", "~", "Home directory")
				set_mark("c", vim.fn.stdpath("config"), "Config") -- path
				set_mark("g", "~/Projects/personal/learn/golang/", "Go Projects")
				set_mark("r", "~/Projects/personal/learn/rust/", "Rust Projects")
			end,
		})
	end,
}
