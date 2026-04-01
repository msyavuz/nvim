local au = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup

-- Highlight on yank
au("TextYankPost", {
  group = ag("YankHighlight", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

-- Filetype detection
vim.filetype.add({
  extension = {
    mdx = "mdx",
    templ = "templ",
  },
  pattern = {
    [".env.*"] = "sh",
    ["*/templates/**/*.html"] = {
      priority = math.huge,
      "htmldjango",
    },
  },
  filename = {
    ["docker-compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    ["compose.yaml"] = "yaml.docker-compose",
  },
})

au("BufEnter", {
  group = ag("FiletypeChange", { clear = true }),
  pattern = "*/templates/**/*.html",
  command = "set filetype=htmldjango",
})

-- Disable emmet for tsx
au("FileType", {
  pattern = "typescriptreact",
  callback = function()
    for _, client in ipairs(vim.lsp.get_clients({ name = "emmet_language_server" })) do
      client:stop()
    end
  end,
})

-- Disable diagnostics in node_modules
au({ "BufNewFile", "BufRead" }, {
  group = ag("DisableNodeModulesEslint", { clear = true }),
  pattern = { "**/node_modules/**", "node_modules", "/node_modules/*" },
  callback = function() vim.diagnostic.enable(false) end,
})

-- LSP Progress
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
au("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params
        .value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= "table" then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ("[%3d%%] %s%s"):format(
            value.kind == "end" and 100 or value.percentage or 100,
            value.title or "",
            value.message and (" **%s**"):format(value.message) or ""
          ),
          done = value.kind == "end",
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(table.concat(msg, "\n"), "info", {
      id = "lsp_progress",
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and " "
            or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

-- Hyprland LSP
au({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { "hyprlang" },
  callback = function(event)
    print(string.format("starting hyprls for %s", vim.inspect(event)))
    vim.lsp.start {
      name = "hyprlang",
      cmd = { "hyprls" },
      root_dir = vim.fn.getcwd(),
    }
  end
})

-- ScrollOffEOF
au({ "CursorMoved", "CursorMovedI", "BufEnter" }, {
  group = ag("ScrollOffEOF", {}),
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

-- LspInfo command
vim.api.nvim_create_user_command("LspInfo", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    print("No LSP")
    return
  end
  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  print(table.concat(names, ", "))
end, {})
