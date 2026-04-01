vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/echasnovski/mini.icons',
  'https://github.com/stevearc/oil.nvim',
})

require("oil").setup({
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  lsp_file_methods = {
    autosave_changes = true,
  },
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, bufnr)
      return (name == "..")
    end,
  },
  keymaps = {
    ["gs"] = false
  }
})
