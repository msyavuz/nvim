function LspInfo()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    return "No LSP"
  end
  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  print(table.concat(names, ", "))
end

vim.api.nvim_create_user_command("LspInfo", LspInfo, {})
