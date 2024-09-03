return {
	"nvim-neorg/neorg",
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.keybinds"] = {},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.integrations.nvim-cmp"] = {},
				["core.concealer"] = {
					config = { folds = true },
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/Notes",
						},
						default_workspace = "notes",
					},
				},
			},
		})
		vim.keymap.set("n", "<,", "`<Plug>(neorg.promo.demote)", {})
	end,

	keys = {
		{ "<leader>n", "<cmd>Neorg workspace notes<CR>" },
	},
}
