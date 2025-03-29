--- @type vim.lsp.Config
return {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = { "html", "css", "angular", "heex" },
  root_markers = { ".git" },
  init_options = {
    showExpandedAbbreviation = "inMarkupAndStylesheetFilesOnly",
  },
}
