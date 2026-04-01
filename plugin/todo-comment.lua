vim.pack.add({
  'https://github.com/folke/todo-comments.nvim',
})

require("todo-comments").setup({})

vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
vim.keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "Todo (Trouble)" })
vim.keymap.set("n", "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", { desc = "Todo/Fix/Fixme (Trouble)" })
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Todo" })
vim.keymap.set("n", "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { desc = "Todo/Fix/Fixme" })
