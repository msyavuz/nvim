return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup({ show_success_message = true })
	end,

	keys = {
		{
			"<leader>rr",
			function()
				require("refactoring").select_refactor({ show_success_message = true })
			end,
			mode = { "n", "x" },
			desc = "[R]efacto[r]",
		},
	},
}
