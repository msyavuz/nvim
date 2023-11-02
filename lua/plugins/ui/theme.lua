--TokyoNight
return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup {
            style = "night",
            transparent = true,
            on_highlights = function(hl, c)
                local prompt = "#2d3149"
                hl.TelescopeNormal = {
                    bg = "none",
                    fg = c.fg_dark,
                }
                hl.TelescopeBorder = {
                    bg = "none",
                    fg = c.bg_dark,
                }
                hl.TelescopePromptNormal = {
                    bg = prompt,
                }
                hl.TelescopePromptBorder = {
                    bg = "none",
                    fg = prompt,
                }
                hl.TelescopePromptTitle = {
                    bg = "none",
                    fg = prompt,
                }
                hl.TelescopePreviewTitle = {
                    bg = "none",
                    fg = c.bg_dark,
                }
                hl.TelescopeResultsTitle = {
                    bg = "none",
                    fg = c.bg_dark,
                }
                hl.NeoTreeNormal = {
                    bg = "none",
                    fg = c.fg_dark,
                }
                hl.NeoTreeNormalNC = {
                    bg = "none",
                    fg = c.fg_dark,
                }
                hl.LuaLineBlend = {
                    bg = "none",
                }
            end,
        }
        vim.cmd [[colorscheme tokyonight]]
    end,
}
