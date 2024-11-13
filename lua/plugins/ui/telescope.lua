local keymaps = {
  {
    "<leader>ff",
    function()
      require("telescope.builtin").find_files({
        hidden = true,
        find_command = {
          "rg",
          "-uu",
          "--files",
          "--hidden",
          "-g",
          "!.git/",
          "-g",
          "!node_modules",
          "-g",
          "!tmp/",
          "-g",
          "!build/",
          "-g",
          "!dist/",
        },
      })
    end,
    desc = "[F]ind [f]iles",
  },
  {
    "<leader>fq",
    function()
      require("telescope.builtin").diagnostics()
    end,
    desc = "[F]ind [q]uickfix list",
  },
  {
    "<leader>fch",
    function()
      require("telescope.builtin").command_history()
    end,
    desc = "[F]ind [r]ecent files",
  },
  {
    "<leader>fxh",
    function()
      require("telescope.builtin").search_history()
    end,
    desc = "[F]ind [r]ecent files",
  },
  {
    "<leader>fb",
    function()
      require("telescope.builtin").buffers()
    end,
    desc = "[F]ind [b]uffers",
  },
  {
    "<leader>f/",
    function()
      require("telescope.builtin").current_buffer_fuzzy_find()
    end,
    desc = "[/] Fuzzy find in current buffer",
  },
  {
    "<leader>fg",
    function()
      require("telescope.builtin").git_files()
    end,
    desc = "[F]ind [g]it files",
  },
  {
    "<leader>fh",
    function()
      require("telescope.builtin").help_tags()
    end,
    desc = "[F]ind [h]help",
  },
  {
    "<leader>faw",
    function()
      require("telescope.builtin").grep_string()
    end,
    desc = "[F]ind current [w]ord",
  },

  {
    "<leader>fw",
    function()
      require("telescope.builtin").grep_string({ grep_open_files = true })
    end,
    desc = "[F]ind current [w]ord",
  },
  {
    "<leader>fs",
    function()
      require("telescope.builtin").live_grep()
    end,
    desc = "[Fs] Find by grep",
  },
  {
    "<leader>fr",
    function()
      require("telescope.builtin").resume()
    end,
    desc = "[F]ind [r]esume",
  },
  {
    "gr",
    function()
      require("telescope.builtin").lsp_references({ show_line = false })
    end,
    desc = "[G]oto [r]eferences",
  },
  {
    "gd",
    function()
      require("telescope.builtin").lsp_definitions({ show_line = false })
    end,
    desc = "[G]oto [d]efinitions",
  },

  {
    "gI",
    function()
      require("telescope.builtin").lsp_implementations({ show_line = false })
    end,
    desc = "[G]oto [I]mplementations",
  },
  {
    "<leader>D",
    function()
      require("telescope.builtin").lsp_type_definitions({ show_line = false })
    end,
    desc = "Type [D]efinition",
  },

  {
    "<leader>ds",
    function()
      require("telescope.builtin").lsp_document_symbols({ show_line = false })
    end,
    desc = "[D]ocument [S]ymbols",
  },
  {
    "<leader>ws",
    function()
      require("telescope.builtin").lsp_dynamic_workspace_symbols({ show_line = false })
    end,
    desc = "[W]orkspace [S]ymbols",
  },

}

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    "debugloop/telescope-undo.nvim",
  },
  config = function()
    local extensions = { "fzf", "grapple", "undo" }
    require("telescope").setup({
      defaults = {
        layout_config = {
          width = 0.9,
        },
        preview = {
          filesize_limit = 0.9,
          timeout = 250,
        },
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
        sorting_strategy = "ascending",
      },
    })
    for _, extension in ipairs(extensions) do
      require("telescope").load_extension(extension)
    end
  end,
  keys = keymaps,
}
