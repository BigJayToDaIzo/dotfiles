return {
	-- I've done quite a bit of 'tweaking here'
	-- :h bufferline<C-d>
	"akinsho/bufferline.nvim",
	branch = "main",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	enabled = true,
	config = function()
		require("bufferline").setup({
			options = {
				-- ALL configuration takes place inside this options table
				themable = true,
				indicator = {
					style = "underline",
				},
				buffer_close_icon = "󰅚 ",
				modified_icon = " ",
				close_icon = " ",
				left_trunc_marker = "󰳞 ",
				right_trunc_marker = "󰳠 ",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and "󰅚 " or (e == "warning" and " " or " ")
						s = s .. n .. sym
					end
					return s
				end,
				separator_style = "slant", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
				-- I like oil, but the neotree nerds will like this!
				-- offsets = {
				-- 	{
				-- 		filetype = "neo-tree",
				-- 		text = "The Matrix is everywhere. -Morpheus",
				-- 		highlight = "Directory",
				-- 		separator = true,
				-- 		text_align = "left",
				-- 	},
				-- },
				color_icons = true,
			},
		})
		-- TODO: Keybinds ASAP! <leader>b?
		--
	end,
}
