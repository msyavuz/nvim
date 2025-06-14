return {
  -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",

    --context
    "nvim-treesitter/nvim-treesitter-context",

  },

  build = ":TSUpdate",
  config = function()
    vim.defer_fn(function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        sync_install = false,
        ignore_install = {},

        indent = { enable = false },
        highlight = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<M-space>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["ia"] = "@attribute.inner",
              ["aa"] = "@attribute.outer",
              ["ap"] = "@parameter.outer",
              ["ip"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
            },
          },
        },
      })
    end, 0)

    require("treesitter-context").setup({
      max_lines = 1,
    })

    vim.treesitter.language.register("markdown", "mdx")

    require("nvim-ts-autotag").setup({
      enable = true,
      enable_close_on_slash = false,
      filetypes = {
        "angular",
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "tsx",
        "jsx",
        "rescript",
        "xml",
        "php",
        "markdown",
        "astro",
        "glimmer",
        "handlebars",
        "hbs",
      },
    })
  end,
}
