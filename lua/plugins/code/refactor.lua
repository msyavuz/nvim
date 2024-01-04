return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup({})
	end,

	keys = {
		{
			"<leader>rr",
			function()
				require("refactoring").select_refactor({})
			end,
			mode = { "n", "x" },
			desc = "[R]efacto[r]",
		},
	},
}
