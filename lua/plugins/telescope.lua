local keymaps = {
    {
        "<leader>ff",
        function()
            require("telescope.builtin").find_files()
        end,
        desc = "[F]ind [F]iles",
    },
}

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = "make",
            cond = function()
                return vim.fn.executable "make" == 1
            end,
        },
    },
    config = function()
        require("telescope").setup {
            defaults = {
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                    },
                },
            },
            pickers = {
                find_files = {
                    sorting_strategy = "ascending",
                },
            },
        }
        pcall(require("telescope").load_extension, "fzf")
    end,
    keys = keymaps,
}
