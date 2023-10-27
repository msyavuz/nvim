return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>fv", "<cmd>Neotree<CR>", desc = "[F]ile [v]iew" },
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("neo-tree").setup {
            sources = { "filesystem", "buffers", "git_status", "document_symbols" },
            window = {
                position = "left",
                width = 30,
            },
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = { enabled = true },
                hijack_netrw_behaviour = "open_current",
                use_libuv_file_watcher = true,
            },
        }
    end,
    lazy = false,
}
