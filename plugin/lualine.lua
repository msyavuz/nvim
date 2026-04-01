vim.pack.add({
  'https://github.com/nvim-lualine/lualine.nvim',
})

vim.g.lualine_laststatus = vim.o.laststatus
if vim.fn.argc(-1) > 0 then
  vim.o.statusline = " "
else
  vim.o.laststatus = 0
end

vim.schedule(function()
  local icons = require("icons")
  vim.o.laststatus = vim.g.lualine_laststatus

  require("lualine").setup({
    options = {
      theme = "tokyonight",
      globalstatus = true,
      disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        {
          require("grapple").statusline,
          cond = require("grapple").exists,
        },
      },
      lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1 },
      },
      lualine_x = {
        {
          "filetype",
          icon_only = false,
          separator = "",
          padding = { left = 0, right = 1 },
          icon = { align = "right" },
        },
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
        },
      },
      lualine_y = {
        { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      },
      lualine_z = {
        function()
          return " " .. os.date("%R")
        end,
      },
    },
  })
end)
