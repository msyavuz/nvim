local keymaps = {
	{
		"<leader>ff",
		function()
			require("telescope.builtin").find_files({
				hidden = true,
				find_command = {
					"rg",
					"-uu",
					"--files",
					"--hidden",
					"-g",
					"!.git/",
					"-g",
					"!node_modules",
					"-g",
					"!tmp/",
					"-g",
					"!build/",
					"-g",
					"!dist/",
				},
			})
		end,
		desc = "[F]ind [f]iles",
	},
	{
		"<leader>fq",
		function()
			require("telescope.builtin").diagnostics()
		end,
		desc = "[F]ind [q]uickfix list",
	},
	{
		"<leader>fr",
		function()
			require("telescope.builtin").oldfiles()
		end,
		desc = "[F]ind [r]ecent files",
	},
	{
		"<leader>fb",
		function()
			require("telescope.builtin").buffers()
		end,
		desc = "[F]ind [b]uffers",
	},
	{
		"<leader>f/",
		function()
			require("telescope.builtin").current_buffer_fuzzy_find()
		end,
		desc = "[/] Fuzzy find in current buffer",
	},
	{
		"<leader>fg",
		function()
			require("telescope.builtin").git_files()
		end,
		desc = "[F]ind [g]it files",
	},
	{
		"<leader>fh",
		function()
			require("telescope.builtin").help_tags()
		end,
		desc = "[F]ind [h]help",
	},
	{
		"<leader>fw",
		function()
			require("telescope.builtin").grep_string()
		end,
		desc = "[F]ind current [w]ord",
	},
	{
		"<leader>fs",
		function()
			require("telescope.builtin").live_grep()
		end,
		desc = "[Fs] Find by grep",
	},
	{
		"<leader>fr",
		function()
			require("telescope.builtin").resume()
		end,
		desc = "[F]ind [r]esume",
	},
	{
		"<leader>flb",
		function()
			require("telescope").extensions.dap.list_breakpoints({})
		end,
		desc = "[F]ind [l]ist of [b]reakpoints",
	},
	{
		"<leader>flv",
		function()
			require("telescope").extensions.dap.variables({})
		end,
		desc = "[F]ind [l]ist of [v]ariables",
	},
}

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			-- NOTE: If you are having trouble with this installation,
			--       refer to the README for telescope-fzf-native for more instructions.
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{
			"nvim-telescope/telescope-dap.nvim",
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
					},
				},
				sorting_strategy = "ascending",
			},
		})
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "dap")
		pcall(require("telescope").load_extension, "grapple")
	end,
	keys = keymaps,
}
