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
			mode = { "n", "x" },
			"<leader>rr",
			function()
				require("refactoring").select_refactor()
			end,
			desc = "[R]efactor",
		},
	},
}
