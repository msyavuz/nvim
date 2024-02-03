local linters = {
	lua = { "luacheck" },
	python = { "flake8" },
	gdscript = { "gdlint" },
	gitcommit = { "commitlint" },
	go = { "golangcilint" },
	sql = { "sqlfluff" },
	json = { "jsonlint" },
	markdown = { "misspell" },
	htmldjango = { "djlint" },
}

return {
	"mfussenegger/nvim-lint",

	config = function()
		require("lint").linters.misspell = {
			cmd = "misspell",
			stdin = false,
			append_fname = true,
			stream = "stdout",
			parser = require("lint.parser").from_errorformat(
				"%f:%l:%c: %m",
				{ severity = vim.diagnostic.severity.INFO, source = "misspell" }
			),
		}

		require("lint").linters.commitlint.args = {
			"-g",
			"/home/msyavuz/.config/defaults/.commitlintrc.json",
		}

		require("lint").linters_by_ft = linters

		require("lint").linters.sqlfluff.args = {
			"--dialect=sqlite",
		}

		local augroup = vim.api.nvim_create_augroup("Linter", { clear = true })

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
			group = augroup,
		})
	end,
}
