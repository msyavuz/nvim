vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Early plugin deps needed before plugin/ files load
vim.pack.add({
  'https://github.com/b0o/schemastore.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/neovim/nvim-lspconfig',
})

require("options")
require("autocmds")
require("keymaps")

vim.lsp.enable({
  "astro",
  "astro_ls",
  "ansiblels",
  "arduino_language_server",
  "bash_ls",
  "biome",
  "clangd",
  "csharp_ls",
  "cssls",
  "css_variables_ls",
  "cssmodules_ls",
  "docker_language_server",
  "docker_compose_language_service",
  "dockerls",
  "emmet_language_server",
  "expert",
  "gopls",
  "html_ls",
  "jsonls",
  "lua_ls",
  "nil_ls",
  "pyright",
  "rust_analyzer",
  "tailwindcss",
  "ts_ls",
  "yamlls",
  "zls",
})
