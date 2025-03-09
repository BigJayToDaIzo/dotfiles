return {
	"lewis6991/hover.nvim",
	config = function()
		require("hover").setup({
			init = function()
				require("hover.providers.lsp")
				require("hover.providers.dap")
				require("hover.providers.diagnostic")
				require("hover.providers.man")
				-- require("hover.providers.dictionary")
			end,
			preview_opts = {
				border = "single",
			},
		})
		-- Setup keymaps
		vim.keymap.set("n", "K", function()
			local api = vim.api
			local hover_win = vim.b.hover_preview
			if hover_win and api.nvim_win_is_valid(hover_win) then
				api.nvim_set_current_win(hover_win)
			else
				require("hover").hover()
			end
		end, { desc = "hover.nvim" })
		vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
		vim.keymap.set("n", "<C-p>", function()
			require("hover").hover_switch("previous")
		end, { desc = "hover.nvim (previous source)" })
		vim.keymap.set("n", "<C-n>", function()
			require("hover").hover_switch("next")
		end, { desc = "hover.nvim (next source)" })
	end,
}
