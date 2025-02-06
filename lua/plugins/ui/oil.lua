return {
  "stevearc/oil.nvim",
  opts = {
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
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons" },
}
