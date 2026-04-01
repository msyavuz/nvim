vim.pack.add({
  'https://github.com/tpope/vim-repeat',
  'https://github.com/ggandor/leap.nvim',
  'https://github.com/ggandor/flit.nvim',
})

local leap = require("leap")
leap.add_default_mappings(true)
vim.keymap.del({ "x", "o" }, "x")
vim.keymap.del({ "x", "o" }, "X")

require("flit").setup({ labeled_modes = "nx" })
