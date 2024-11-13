local keymap = vim.keymap

keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Diagnostics
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap.set("n", "<leader>fd", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Center
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })

-- Oil
keymap.set("n", "<leader>fv", require("oil").open, { desc = "Open directory" })

-- Quick buffer switch
keymap.set("n", "<tab>", "<cmd>b#<cr>", { desc = "Switch to last buffer" })

-- Switch relative line numbers
keymap.set("n", "<leader>rln", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
  vim.opt.number = true
end, { desc = "Relative line numbers" })

-- Copy file
keymap.set("n", "<C-c>", "<cmd>%y+<CR>")

-- Exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode" })

-- Paste last yanked register
keymap.set("n", ",p", '"0p', { desc = "Paste last yanked register" })
keymap.set("n", ",P", '"0P', { desc = "Paste last yanked register" })

-- When highligh pasting keep the yank buffer
keymap.set("x", "<leader>p", [["_dP]])

-- Change the word under cursor interactive
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Copy current files relative filepath
keymap.set("n", "<C-p>", "<cmd>!echo % | cb<CR>", { silent = true, script = true })
