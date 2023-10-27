--TokyoNight
return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup {
            style = "night",
            transparent = true,
            on_highlights = function(hl, c) end,
        }
        vim.cmd [[colorscheme tokyonight]]
    end,
}
