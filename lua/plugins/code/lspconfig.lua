local servers = {
	"angularls",
	"astro",
	"bashls",
	"clangd",
	"cssls",
	"csharp_ls",
	"dockerls",
	"emmet_language_server",
	"elixirls",
	"eslint",
	"gopls",
	"gdscript",
	"html",
	"htmx",
	"jsonls",
	"lua_ls",
	"pyright",
	"sqlls",
	"svelte",
	"tailwindcss",
	"taplo",
	"templ",
	"tsserver",
	"ruff_lsp",
	"rust_analyzer",
}

return {

	"neovim/nvim-lspconfig",
	dependencies = {
		"b0o/schemastore.nvim",
		-- Auto install servers
		{
			"williamboman/mason.nvim",
			opts = {},
		},
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				automatic_installation = false,
			},
		},
	},
	config = function()
		local on_attach = require("constants").on_attach
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		local lspconfig = require("lspconfig")

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end

		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			init_options = {
				preferences = {
					quotePreference = "double",
					includeCompletionsForModuleExports = true,
					includeCompletionsForImportStatements = true,
					includeCompletionsWithSnippetText = true,
					includeAutomaticOptionalChainCompletions = true,
					includeCompletionsWithClassMemberSnippets = true,
					includeCompletionsWithInsertText = true,
					importModuleSpecifierPreference = "non-relative",
					importModuleSpecifierEnding = "minimal",
					provideRefactorNotApplicableReason = true,
					allowRenameOfImportPath = true,
					allowTextChangesInNewFiles = true,
					displayPartsForJSDoc = true,
					generateReturnInDocTemplate = true,
				},
			},
		})

		lspconfig.angularls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
			filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "angular" },
			root_dir = lspconfig.util.root_pattern("angular.json"),
		})

		lspconfig.emmet_language_server.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "html", "css", "angular", "heex" },
		})

		lspconfig.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "python" },
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "off",
					},
				},
			},
		})

		lspconfig.bashls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "sh", "zsh" },
		})

		lspconfig.tailwindcss.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "templ", "astro", "react", "htmldjango", "angular", "heex" },
			init_options = { userLanguages = { templ = "html", angular = "html", heex = "html" } },
			root_dir = function(fname)
				local root_pattern = require("lspconfig").util.root_pattern(
					"tailwind.config.cjs",
					"tailwind.config.js",
					"postcss.config.js",
					"assets/tailwind.config.cjs",
					"assets/tailwind.config.js"
				)
				return root_pattern(fname)
			end,
		})
		lspconfig.html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "html", "templ", "angular", "heex" },
		})

		lspconfig.htmx.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "html", "templ" },
		})

		lspconfig.jsonls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})
	end,
}
