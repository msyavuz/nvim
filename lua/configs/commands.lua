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

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("ScrollOffEOF", {}),
  callback = function()
    local win_h = vim.api.nvim_win_get_height(0)
    local off = math.min(vim.o.scrolloff, math.floor(win_h / 2))
    local dist = vim.fn.line "$" - vim.fn.line "."
    local rem = vim.fn.line "w$" - vim.fn.line "w0" + 1
    if dist < off and win_h - rem + dist < off then
      local view = vim.fn.winsaveview()
      view.topline = view.topline + off - (win_h - rem + dist)
      vim.fn.winrestview(view)
    end
  end,
})
