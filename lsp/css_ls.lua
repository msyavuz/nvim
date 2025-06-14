---@type vim.lsp.Config
return {
  cmd = { "vscode-css-language-server", "--stdio" },
  root_markers = { "package.json", ".git" },
  filetypes = { "css", "scss", "less" },
  init_options = {
    providerFormatter = true,
  },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  }
}
