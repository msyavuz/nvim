vim.pack.add({
  'https://github.com/cbochs/grapple.nvim',
})

require("grapple").setup({
  scope = "git_branch",
})

vim.keymap.set("n", "<C-e>", "<cmd>Grapple toggle_tags<cr>", { desc = "Toggle tags menu" })
vim.keymap.set("n", "<leader>hf", "<cmd>Telescope grapple tags<cr>", { desc = "Find in tags" })
vim.keymap.set("n", "<leader>h1", "<cmd>Grapple select index=1<cr>", { desc = "Select first tag" })
vim.keymap.set("n", "<leader>h2", "<cmd>Grapple select index=2<cr>", { desc = "Select second tag" })
vim.keymap.set("n", "<leader>h3", "<cmd>Grapple select index=3<cr>", { desc = "Select third tag" })
vim.keymap.set("n", "<leader>h4", "<cmd>Grapple select index=4<cr>", { desc = "Select fourth tag" })
vim.keymap.set("n", "<leader>hp", "<cmd>Grapple cycle backward<cr>", { desc = "Go to previous tag" })
vim.keymap.set("n", "<leader>hn", "<cmd>Grapple cycle forward<cr>", { desc = "Go to next tag" })

vim.keymap.set("n", "<C-a>", function()
  local filetype = vim.bo.filetype
  local Grapple = require("grapple")
  local Path = require("grapple.path")

  if filetype == "oil" then
    local Oil = require("oil")
    local filename = Oil.get_cursor_entry().name
    local directory = Oil.get_current_dir()
    Grapple.toggle({ path = Path.join(directory, filename) })
  else
    Grapple.toggle()
  end
end, { desc = "Tag under cursor" })
