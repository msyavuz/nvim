local formatters = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { { "prettier", "prettier" } },
    typescript = { { "prettier", "prettier" } },
    javascriptreact = { { "prettier", "prettier" } },
    typescriptreact = { { "prettier", "prettier" } },
    css = { { "prettier", "prettier" } },
    html = { { "prettier", "prettier" } },
    sql = { "sqlfmt" },
    cpp = { "clang_format" },
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
            prettier = {
                arg = { "--config", "/home/msyavuz/.config/defaults/.prettierrc.json" },
                env = {
                    PRETTIERD_DEFAULT_CONFIG = "/home/msyavuz/.config/defaults/.prettierrc.json",
                },
            },
            clang_format = {
                prepend_args = { "--style=file:/home/msyavuz/.config/defaults/.clang-format" },
            },
        },
    },
}
