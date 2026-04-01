vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
      local dir = vim.fn.stdpath('data') .. '/site/pack/core/opt/telescope-fzf-native.nvim'
      vim.fn.system('make -C ' .. dir)
    end
  end
})

vim.pack.add({
  'https://github.com/nvim-telescope/telescope-live-grep-args.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/debugloop/telescope-undo.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
})

require("telescope").setup({
  defaults = {
    layout_config = {
      width = 0.9,
    },
    preview = {
      filesize_limit = 0.9,
      timeout = 250,
    },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    sorting_strategy = "ascending",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--glob",
      "!.git/",
    },
  },
})

-- Load extensions, skip fzf if not built yet
local extensions = { "fzf", "grapple", "undo", "live_grep_args" }
for _, extension in ipairs(extensions) do
  pcall(require("telescope").load_extension, extension)
end

-- Keymaps
vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files({
    hidden = true,
    find_command = {
      "rg", "-uu", "--files", "--hidden",
      "-g", "!.git/", "-g", "!node_modules",
      "-g", "!tmp/", "-g", "!build/", "-g", "!dist/",
    },
  })
end, { desc = "[F]ind [f]iles" })
vim.keymap.set("n", "<leader>fq", function() require("telescope.builtin").diagnostics() end, { desc = "[F]ind [q]uickfix list" })
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "[F]ind [b]uffers" })
vim.keymap.set("n", "<leader>f/", function() require("telescope.builtin").current_buffer_fuzzy_find() end, { desc = "[/] Fuzzy find in current buffer" })
vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").git_files() end, { desc = "[F]ind [g]it files" })
vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "[F]ind [h]help" })
vim.keymap.set("n", "<leader>fw", function() require("telescope.builtin").grep_string({ grep_open_files = true }) end, { desc = "[F]ind current [w]ord" })
vim.keymap.set("n", "<leader>fs", function() require("telescope.builtin").live_grep() end, { desc = "[Fs] Find by grep" })
vim.keymap.set("n", "<leader>fn", function() require("telescope").extensions.live_grep_args.live_grep_args() end, { desc = "[Fn] Find with args" })
vim.keymap.set("n", "<leader>fr", function() require("telescope.builtin").resume() end, { desc = "[F]ind [r]esume" })
vim.keymap.set("n", "<leader>fu", function() require("telescope").extensions.undo.undo() end, { desc = "[F]ind [u]ndo" })
vim.keymap.set("n", "<leader>fk", function() require("telescope.builtin").keymaps() end, { desc = "[F]ind [k]eymaps" })
vim.keymap.set("n", "<leader>fp", function() require("telescope.builtin").spell_suggest() end, { desc = "[F]ind s[p]ell suggestions" })

-- LSP
vim.keymap.set("n", "gr", function() require("telescope.builtin").lsp_references({ show_line = false }) end, { desc = "[G]oto [r]eferences" })
vim.keymap.set("n", "gd", function() require("telescope.builtin").lsp_definitions({ show_line = false }) end, { desc = "[G]oto [d]efinitions" })
vim.keymap.set("n", "gI", function() require("telescope.builtin").lsp_implementations({ show_line = false }) end, { desc = "[G]oto [I]mplementations" })
