return {
	"mfussenegger/nvim-lint",
	config = function()
		-- local venv_path = os.getenv("VIRTUAL_ENV")
		-- local py_path = nil
		-- decide which python executable to use for mypy
		-- if venv_path ~= nil then
		-- 	py_path = venv_path .. "/bin/python3"
		-- 	print(py_path)
		-- else
		-- 	py_path = vim.g.python3_host_prog
		-- end
		-- local mypy = require("lint").linters.mypy
		-- mypy.args = {
		-- 	"--show-column-numbers",
		-- 	"--show-error-end",
		-- 	"--hide-error-codes",
		-- 	"--hide-error-context",
		-- 	"--no-color-output",
		-- 	"--no-error-summary",
		-- 	"--no-pretty",
		-- 	"--python-executable",
		-- 	py_path,
		-- }
		require("lint").linters_by_ft = {
			-- gitcommit = { "commitlint" },
			python = { "ruff", "mypy" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
