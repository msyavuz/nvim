return {
  'nvim-pack/nvim-spectre',
  keys = {
    {
      "<leader>S",
      function()
        require("spectre").toggle()
      end,
      desc = "Toggle Spectre",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      desc = "Search current word",
      mode = { "n" },
    },

    {
      "<leader>sw",
      function()
        require("spectre").open_visual()
      end,
      desc = "Search current word",
      mode = { "v" },
    },
    {
      "<leader>sp",
      function()
        require("spectre").open_file_search({ select_word = true })
      end,
      desc = "Search in file",
    }
  }
}
