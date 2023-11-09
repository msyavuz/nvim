local formatters = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { { "prettier", "prettier" } },
    typescript = { { "prettier", "prettier" } },
    javascriptreact = { { "prettier", "prettier" } },
    typescriptreact = { { "prettier", "prettier" } },
    css = { { "prettier", "prettier" } },
    html = { { "prettier", "prettier" } },
}

return {

    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = formatters,
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters = {
            prettierd = {
                arg = { "--config", "/home/msyavuz/.config/defaults/.prettierrc.json" },
                env = {
                    PRETTIERD_DEFAULT_CONFIG = "/home/msyavuz/.config/defaults/.prettierrc.json",
                },
            },
        },
    },
}
