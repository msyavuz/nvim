local opt = vim.opt
local api = vim.api
--cursor

api.nvim_set_hl(0, "InsertCursor", { bg = "#96CBFE" })

opt.guicursor = "i:block-InsertCursor"

--hlsearch
opt.hlsearch = false

--line numbers
opt.number = true
opt.relativenumber = true

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

opt.termguicolors = true

-- Tabwidth
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

opt.scrolloff = 16

-- For Oil.nvim preview split
opt.splitright = true

opt.clipboard = "unnamedplus"

-- Remove tilde on end of buffers
opt.fillchars = { eob = " " }

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

vim.filetype.add({
  extension = {
    templ = "templ",
  },
  pattern = {
    ["*/templates/**/*.html"] = {
      priority = math.huge,
      "htmldjango",
    },
  },
})
local filetype_group = vim.api.nvim_create_augroup("FiletypeChange", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = filetype_group,
  pattern = "*/templates/**/*.html",
  command = "set filetype=htmldjango",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescriptreact",
  callback = function()
    vim.lsp.stop_client(vim.lsp.get_clients({
      name = "emmet_language_server",
    }))
  end,
})

vim.lsp.enable({
  "angular_ls",
  "astro",
  "astro_ls",
  "bash_ls",
  "biome_ls",
  "clangd",
  "csharp_ls",
  "css_ls",
  "css_variables_ls",
  "cssmodules_ls",
  "docker_ls",
  "emmet_language_server",
  "eslint_ls",
  "gopls",
  "html_ls",
  "json_ls",
  "lexical",
  "lua_ls",
  "pyright",
  "tailwindcss_ls",
  "ts_ls",
})

vim.diagnostic.config({ virtual_text = true })

function GetActiveLSPs()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if #clients == 0 then
    return "No LSP"
  end
  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  return table.concat(names, ", ")
end

-- Autocommands
local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

local disable_node_modules_eslint_group =
    ag("DisableNodeModulesEslint", { clear = true })

au({ "BufNewFile", "BufRead" }, {
  pattern = { "**/node_modules/**", "node_modules", "/node_modules/*" },
  callback = function()
    vim.diagnostic.disable(0)
  end,
  group = disable_node_modules_eslint_group,
})


--- Lsp Progress
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
        notif.icon = #progress[client.id] == 0 and " "
            or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})
