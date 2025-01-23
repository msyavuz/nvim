local prettier_langs = {
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
  "css",
  "html",
  "json",
  -- "svelte",
  "angular",
  -- "astro",
}
local slow_format_filetypes = {}
local options = {
  log_level = vim.log.levels.DEBUG,
  format_on_save = function(bufnr)
    if slow_format_filetypes[vim.bo[bufnr].filetype] then
      return
    end
    local function on_format(err)
      if err and err:match("timeout$") then
        slow_format_filetypes[vim.bo[bufnr].filetype] = true
      end
    end

    return { timeout_ms = 200, lsp_fallback = true }, on_format
  end,

  format_after_save = function(bufnr)
    if not slow_format_filetypes[vim.bo[bufnr].filetype] then
      return
    end
    return { lsp_fallback = true }
  end,

  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    gdscript = { "gdformat" },
    go = { "goimports", "gofumpt" },
    heex = { "mix" },
    elixir = { "mix" },
    eelixir = { "mix" },
    rust = { "rustfmt" },
    ruby = { "standardrb" },
    php = { "easy-coding-standard" },
    blade = { "blade-formatter" }
  },
}

for _, lang in ipairs(prettier_langs) do
  options.formatters_by_ft[lang] = { "prettier" }
end

return {
  "stevearc/conform.nvim",
  opts = options,
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
}
