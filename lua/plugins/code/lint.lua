local linters = {
    lua = { "luacheck" },
    python = { "mypy" },
    gdscript = { "gdlint" },
    gitcommit = { "commitlint" },
    go = { "staticcheck" },
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

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
