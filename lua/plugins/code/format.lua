local formatters = {
	lua = { "stylua" },
	python = { "isort", "black" },
	javascript = { "prettier" },
	typescript = { "prettier" },
	javascriptreact = { "prettier" },
	typescriptreact = { "prettier" },
	svelte = { "prettier" },
	astro = { "prettier" },
	json = { "prettier" },
	jsonc = { "prettier" },
	css = { "prettier" },
	html = { "prettier" },
	sql = { "sqlfmt" },
	cpp = { "clang_format" },
	gdscript = { "gdformat" },
	go = { "gofmt" },
}

return {

	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = formatters,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters = {
			prettier = {
				prepend_args = { "--tab-width", 4 },
			},
			clang_format = {
				prepend_args = { "--style=file:/home/msyavuz/.config/defaults/.clang-format" },
			},
		},
	},
}
