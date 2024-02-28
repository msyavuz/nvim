local prettier_langs = {
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
	"css",
	"html",
	"json",
	"svelte",
	"angular",
	"astro",
}

local options = {
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		gdscript = { "gdformat" },
		go = { "goimports", "gofumpt" },
		sh = { "shfmt" },
		zsh = { "shfmt" },
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
}

for _, lang in ipairs(prettier_langs) do
	options.formatters_by_ft[lang] = { "prettier" }
end

return {
	"stevearc/conform.nvim",
	opts = options,
}
