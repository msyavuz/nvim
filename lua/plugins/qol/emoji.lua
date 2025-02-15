return {
  "allaman/emoji.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- optional for telescope integration
    "nvim-telescope/telescope.nvim",
  },
  config = function(_, opts)
    require("emoji").setup(opts)
    local ts = require('telescope').load_extension 'emoji'
    vim.keymap.set('n', '<leader>fe', ts.emoji, { desc = '[S]earch [E]moji' })
  end,
}
