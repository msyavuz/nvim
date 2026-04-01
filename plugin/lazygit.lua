vim.pack.add({
  'https://github.com/kdheepak/lazygit.nvim',
})

vim.g.lazygit_floating_window_border_chars = { "", "", "", "", "", "", "", "" }
vim.g.lazygit_floating_window_use_plenary = 0

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open lazy[g]it" })
