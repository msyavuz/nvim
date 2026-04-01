for _, client in ipairs(vim.lsp.get_clients({ name = "emmet_language_server" })) do
  client:stop()
end
