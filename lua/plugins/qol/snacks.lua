return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    gitbrowse = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
    notifier = {
      enabled = true,
      margin = { bottom = 1 },
      top_down = false,
    },
    scratch = {
      enabled = true,
      filekey = {
        cwd = true,
        branch = true,
      }
    }
  },
  keys = {
    { "<leader>gb", function() Snacks.gitbrowse() end,                     desc = "Browser git repository", mode = { "n" } },
    { "]]",         function() Snacks.words.jump(vim.v.count1, true) end,  desc = "Next Reference",         mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1, true) end, desc = "Prev Reference",         mode = { "n", "t" } },
    { "<leader>z",  function() Snacks.zen() end,                           desc = "Toggle Zen Mode",        mode = { "n" } },
    { "<leader>nn", function() Snacks.scratch() end,                       desc = "New Scratch Buffer",     mode = { "n" } },
    { "<leader>nN", function() Snacks.scratch.select() end,                desc = "Select Scratch Buffer",  mode = { "n" } },
  }
}
