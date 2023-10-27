return {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        vim.g.lazygit_floating_window_border_chars = { "", "", "", "", "", "", "", "" } -- customize lazygit popup window border characters
        vim.g.lazygit_floating_window_use_plenary = 0
    end,
    keys = {
        { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open lazy[g]it" },
    },
}
