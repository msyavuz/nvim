local formatters = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
}

return {

    "stevearc/conform.nvim",

    opts = {
        formatters_by_ft = formatters,
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
