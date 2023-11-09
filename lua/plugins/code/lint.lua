local linters = {
    lua = { "luacheck" },
    python = { "ruff" },
    gdscript = { "gdlint" },
    gitcommit = { "commitlint" },
    go = { "staticcheck" },
}

return {
    "mfussenegger/nvim-lint",

    config = function()
        require("lint").linters_by_ft = linters
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
