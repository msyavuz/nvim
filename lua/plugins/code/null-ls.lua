return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			debug = true,
			sources = {
				-- Code actions
				null_ls.builtins.code_actions.gitsigns,
				null_ls.builtins.code_actions.gomodifytags,
				null_ls.builtins.code_actions.impl,
				null_ls.builtins.code_actions.refactoring,

				-- Diagnostics
				null_ls.builtins.diagnostics.commitlint.with({
					extra_args = { "-g", "/home/msyavuz/.config/defaults/.commitlintrc.json" },
				}),
				null_ls.builtins.diagnostics.djlint,
				null_ls.builtins.diagnostics.gdlint,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.diagnostics.sqlfluff.with({
					extra_args = { "--dialect", "sqlite" },
				}),

				-- Formatting
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.prettier.with({
					extra_filetypes = { "svelte", "angular", "astro" },
					extra_args = { "--tab-width", 4 },
				}),
				null_ls.builtins.formatting.sql_formatter.with({
					extra_args = { "--config", "/home/msyavuz/.config/defaults/.sql.json" },
				}),
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style=file:/home/msyavuz/.config/defaults/.clang-format" },
				}),
				null_ls.builtins.formatting.gdformat,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.shfmt,
			},

			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(client)
									return client.name == "null-ls"
								end,
								async = false,
							})
						end,
					})
				end
			end,
		})
	end,
}
