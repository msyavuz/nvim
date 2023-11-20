return {
    "ThePrimeagen/harpoon",
    keys = {
        {
            "<leader>ha",
            function()
                require("harpoon.mark").add_file()
            end,
            desc = "Add file to harpoon",
        },
        {
            "<leader>he",
            function()
                require("harpoon.ui").toggle_quick_menu()
            end,
            desc = "Toggle harpoon menu",
        },
    },
}
