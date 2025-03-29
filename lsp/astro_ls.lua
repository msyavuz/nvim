---@type vim.lsp.Config
return {
  cmd = { "astro-ls", "--stdio" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
  filetypes = { "astro" },
}
