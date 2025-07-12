return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Personal",
        path = "~/Notes/Personal/",
      },
      {
        name = "Daily",
        path = "~/Notes/Daily/",
      },
      {
        name = "Work",
        path = "~/Notes/Work/",
      }
    },

  },
}
