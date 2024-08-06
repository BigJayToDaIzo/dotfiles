return {
	-- NOTE: As always, use what you want.  But LazyGit is worth a try!
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
		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	},
}
