local formatters = {
    lua = { "stylua" },
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
