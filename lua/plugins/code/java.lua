return {
	"mfussenegger/nvim-jdtls",
	ft = { "java" },
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		local opts = {
			cmd = { "jdtls" },
			on_attach = require("constants").on_attach,
			capabilities = capabilities,
			root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
			handlers = {
				["language/status"] = function(_, result) end,
				["$/progress"] = function(_, result, ctx)
					-- disable progress updates.
				end,
			},
		}
		require("jdtls").start_or_attach(opts)
	end,
}
