return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      debounce = 75,
      keymap = {
        accept = "<C-f>",
        next = "<C-n>",
      },
      auto_trigger = true,
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
