vim.pack.add({
  'https://github.com/smjonas/inc-rename.nvim',
})

require("inc_rename").setup({})
vim.keymap.set("n", "<leader>cr", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
