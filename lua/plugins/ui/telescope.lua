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
    "<leader>fn",
    function()
      require("telescope").extensions.live_grep_args.live_grep_args()
    end,
    desc = "[Fn] Find with args"
  },
  {
    "<leader>fr",
    function()
      require("telescope.builtin").resume()
    end,
    desc = "[F]ind [r]esume",
  },
  {
    "<leader>fu",
    function()
      require("telescope").extensions.undo.undo()
    end,
    desc = "[F]ind [u]ndo",
  },
  {
    "<leader>fk",
    function()
      require("telescope.builtin").keymaps()
    end,
    desc = "[F]ind [k]eymaps",
  },
  {
    "<leader>fp",
    function()
      require("telescope.builtin").spell_suggest()
    end,
    desc = "[F]ind s[p]ell suggestions",
  },
  --- LSP
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
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
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
    local extensions = {
      "fzf",
      "grapple",
      "undo",
      "live_grep_args",
    }
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
