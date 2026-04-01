vim.pack.add({
  'https://github.com/folke/which-key.nvim',
})

vim.o.timeout = true
vim.o.timeoutlen = 300

require("which-key").setup({})
