return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
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
			},
		})
	end,
}
