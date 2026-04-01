vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end
})
vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  'https://github.com/windwp/nvim-ts-autotag',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
  'https://github.com/nvim-treesitter/nvim-treesitter'
})

-- nvim-treesitter stores queries under runtime/ which packadd doesn't add to rtp
vim.opt.rtp:append(vim.fn.stdpath('data') .. '/site/pack/core/opt/nvim-treesitter/runtime')

local required_parsers = {
  "bash", "dockerfile", "gitcommit", "gitignore", "go", "gomod", "gosum",
  "html", "htmldjango", "ini", "javascript", "json", "jsonc", "lua", "make",
  "markdown", "markdown_inline", "python", "query", "regex", "rst", "scss",
  "styled", "tmux", "toml", "tsx", "typescript", "vim", "vimdoc", "xml",
  "yaml", "yuck", "zig",
}

vim.api.nvim_create_user_command('TSInstallRequired', function()
  vim.cmd('TSInstall ' .. table.concat(required_parsers, ' '))
end, {})

vim.treesitter.language.register("markdown", "mdx")

-- Enable treesitter highlighting for all filetypes with an available parser
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
    if pcall(vim.treesitter.language.add, lang) then
      pcall(vim.treesitter.start, ev.buf, lang)
    end
  end,
})

-- Textobjects
require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
  },
})

local ts_select = require("nvim-treesitter-textobjects.select")
local textobjects = {
  ["ia"] = "@attribute.inner",
  ["aa"] = "@attribute.outer",
  ["ap"] = "@parameter.outer",
  ["ip"] = "@parameter.inner",
  ["af"] = "@function.outer",
  ["if"] = "@function.inner",
  ["ac"] = "@class.outer",
  ["ic"] = "@class.inner",
  ["al"] = "@loop.outer",
  ["il"] = "@loop.inner",
}
for keymap, query in pairs(textobjects) do
  vim.keymap.set({ "x", "o" }, keymap, function()
    ts_select.select_textobject(query)
  end)
end

require("treesitter-context").setup({
  max_lines = 1,
})

---@diagnostic disable-next-line: missing-fields
require("nvim-ts-autotag").setup({
  enable = true,
  enable_close_on_slash = false,
  filetypes = {
    "angular", "html", "javascript", "typescript", "javascriptreact",
    "typescriptreact", "svelte", "vue", "tsx", "jsx", "rescript", "xml",
    "php", "markdown", "astro", "glimmer", "handlebars", "hbs",
  },
})
