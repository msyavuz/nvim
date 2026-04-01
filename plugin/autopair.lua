vim.pack.add({
  'https://github.com/echasnovski/mini.pairs',
})

require("mini.pairs").setup({})

vim.keymap.set("n", "<leader>up", function()
  vim.g.minipairs_disable = not vim.g.minipairs_disable
  if vim.g.minipairs_disable then
    vim.notify("Disabled auto pairs", vim.log.levels.WARN)
  else
    vim.notify("Enabled auto pairs", vim.log.levels.INFO)
  end
end, { desc = "Toggle auto pairs" })
