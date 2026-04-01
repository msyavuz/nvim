vim.pack.add({
  'https://github.com/echasnovski/mini.move',
})

require("mini.move").setup({
  mappings = {
    left = "<S-A-h>",
    right = "<S-A-l>",
    down = "<S-A-j>",
    up = "<S-A-k>",
    line_left = "<S-A-h>",
    line_right = "<S-A-l>",
    line_down = "<S-A-j>",
    line_up = "<S-A-k>",
  },
})
