vim.pack.add({
  'https://github.com/folke/snacks.nvim',
})

require("snacks").setup({
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
})

vim.keymap.set("n", "<leader>gb", function() Snacks.gitbrowse() end, { desc = "Browser git repository" })
vim.keymap.set({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1, true) end, { desc = "Next Reference" })
vim.keymap.set({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1, true) end, { desc = "Prev Reference" })
vim.keymap.set("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>nn", function() Snacks.scratch() end, { desc = "New Scratch Buffer" })
vim.keymap.set("n", "<leader>nN", function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })
