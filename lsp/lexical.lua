--- @type vim.lsp.Config
return {
  filetypes = { "elixir", "eelixir", "heex" },
  cmd = { "/home/msyavuz/.local/share/nvim/mason/bin/lexical" },
  root_markers = { "mix.exs", ".git" },
}
