local formatters = {
	lua = { "stylua" },
	python = { "isort", "black" },
	javascript = { "prettier" },
	typescript = { "prettier" },
	javascriptreact = { "prettier" },
	typescriptreact = { "prettier" },
	svelte = { "prettier" },
	astro = { "prettier" },
	angular = { "prettier" },
	json = { "prettier" },
	jsonc = { "prettier" },
	css = { "prettier" },
	html = { "prettier" },
	htmldjango = { "djlint" },
	sql = { "sql_formatter" },
	cpp = { "clang_format" },
	gdscript = { "gdformat" },
	go = { "goimports", "gofumpt" },
	sh = { "beautysh" },
	zsh = { "beautysh" },
	templ = { "templ" },
}

return {

	"stevearc/conform.nvim",
	opts = {
		log_level = vim.log.levels.TRACE,
		formatters_by_ft = formatters,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters = {
			sql_formatter = {
				prepend_args = { "--config", "/home/msyavuz/.config/defaults/.sql.json" },
			},
			prettier = {
				prepend_args = { "--tab-width", 4 },
			},
			clang_format = {
				prepend_args = { "--style=file:/home/msyavuz/.config/defaults/.clang-format" },
			},
		},
	},
}
