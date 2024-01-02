return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup()
		require("telescope").load_extension("refactoring")
	end,
	keys = {
		{
			"<leader>rr",
			function()
				require("telescope").extensions.refactoring.refactors()
			end,
			desc = "[R]efactor",
		},
	},
}
