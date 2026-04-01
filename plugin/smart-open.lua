vim.pack.add({
  'https://github.com/kkharji/sqlite.lua',
  'https://github.com/nvim-telescope/telescope-fzy-native.nvim',
  { src = 'https://github.com/danielfalk/smart-open.nvim', version = '0.2.x' },
})

require("telescope").load_extension("smart_open")

vim.keymap.set("n", "<leader><leader>", function()
  require("telescope").extensions.smart_open.smart_open({
    cwd_only = true,
  })
end, { desc = "Smart open" })
