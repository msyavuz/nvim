return {
  "mfussenegger/nvim-lint",
  config = function()
    vim.env.ESLINT_D_PPID = vim.fn.getpid()
    require("lint").linters_by_ft = {
      -- gitcommit = { "commitlint" },
      python = { "ruff" },
      ["yaml.ansible"] = { "ansible_lint" },
      javascript = { "biomejs", "eslint" },
      javascriptreact = { "biomejs", "eslint" },
      typescript = { "biomejs", "eslint" },
      typescriptreact = { "biomejs", "eslint" },
      json = { "biomejs", "eslint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint(nil, { ignore_errors = true })
      end,
    })
  end,
}
