return {
	"psjay/buffer-closer.nvim",
	config = function()
		require("buffer-closer").setup({
			close_key = "ZZ",
		})
	end,
}
