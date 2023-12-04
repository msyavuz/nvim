local linters = {
    lua = { "luacheck" },
    python = { "mypy" },
    gdscript = { "gdlint" },
    gitcommit = { "commitlint" },
    go = { "golangcilint" },
    sql = { "sqlfluff" },
    json = { "jsonlint" },
}

return {
    "mfussenegger/nvim-lint",

    config = function()
        require("lint").linters_by_ft = linters

        require("lint").linters.sqlfluff.args = {
            "--dialect=sqlite",
        }

        local augroup = vim.api.nvim_create_augroup("Linter", { clear = true })

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
            group = augroup,
        })
    end,
}
