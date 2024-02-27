return {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",

		--context
		"nvim-treesitter/nvim-treesitter-context",

		--templ
		"vrischmann/tree-sitter-templ",
	},
	build = ":TSUpdate",
	config = function()
		vim.defer_fn(function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
					enable_close_on_slash = false,
				},
				auto_install = true,
				sync_install = false,
				ignore_install = {},

				indent = { enable = true },
				highlight = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<M-space>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
			})
		end, 0)

		--templ
		local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		treesitter_parser_config.templ = {
			install_info = {
				url = "https://github.com/vrischmann/tree-sitter-templ.git",
				files = { "src/parser.c", "src/scanner.c" },
				branch = "master",
			},
		}
		require("treesitter-context").setup({
			max_lines = 1,
		})

		vim.treesitter.language.register("templ", "templ")

		--angular
		vim.filetype.add({
			extension = {
				html = "angular",
			},
			pattern = {
				["*.component.html"] = "angular",
			},
		})

		require("nvim-ts-autotag").setup({
			filetypes = {
				"angular",
				"html",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"svelte",
				"vue",
				"tsx",
				"jsx",
				"rescript",
				"xml",
				"php",
				"markdown",
				"astro",
				"glimmer",
				"handlebars",
				"hbs",
			},
		})
	end,
}
