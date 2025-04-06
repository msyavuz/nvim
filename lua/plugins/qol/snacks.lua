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
    }
  },
  keys = {
    { "<leader>gb", function() Snacks.gitbrowse() end,                     desc = "Browser git repository", mode = { "n" } },
    { "]]",         function() Snacks.words.jump(vim.v.count1, true) end,  desc = "Next Reference",         mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1, true) end, desc = "Prev Reference",         mode = { "n", "t" } },
    { "<leader>z",  function() Snacks.zen() end,                           desc = "Toggle Zen Mode" },
  }
}
