return {
  'serenevoid/kiwi.nvim',
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  opts = {
    {
      name = "work",
      path = "/home/msyavuz/Notes/Work"
    },
    {
      name = "personal",
      path = "/home/msyavuz/Personal"
    }
  },
  keys = {
    { "<leader>wi", ":lua require(\"kiwi\").open_wiki_index()<cr>",             desc = "Open Wiki index" },
    { "<leader>wp", ":lua require(\"kiwi\").open_wiki_index(\"personal\")<cr>", desc = "Open index of personal wiki" },
    { "<leader>ww", ":lua require(\"kiwi\").open_wiki_index(\"work\")<cr>",     desc = "Open index of work wiki" },
    { "T",          ":lua require(\"kiwi\").todo.toggle()<cr>",                 desc = "Toggle Markdown Task" }
  },
  lazy = true
}

