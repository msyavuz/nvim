---@type vim.lsp.Config
return {
  cmd = { "cssmodules-language-server" },
  root_markers = { "package.json", ".git" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}
