local linters = {
    markdown = { "markdownlint" },
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    lua = { "luacheck" },
    python = { "flake8" },
    gdscript = { "gdlint" },
    gitcommit = { "commitlint" },
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
