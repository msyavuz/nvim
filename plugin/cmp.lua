vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'blink.cmp' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('blink.cmp') end
      local dir = vim.fn.stdpath('data') .. '/site/pack/core/opt/blink.cmp'
      vim.fn.system('cargo build --release -C ' .. dir)
    end
  end
})

vim.pack.add({
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/saghen/blink.cmp',
})

require("blink.cmp").setup({
  keymap = {
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    ['<CR>'] = { 'accept', 'fallback' }
  },
  appearance = {
    nerd_font_variant = 'mono'
  },
  cmdline = {
    enabled = false
  },
  completion = {
    documentation = { auto_show = true },
    trigger = {
      show_on_insert_on_trigger_character = true,
      prefetch_on_insert = true
    },
    menu = {
      auto_show = true,
      draw = {
        columns = {
          { "label",     "label_description", gap = 1 },
          { "kind_icon", "kind" }
        },
      }
    },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  signature = { enabled = true },
  fuzzy = { implementation = "prefer_rust_with_warning" }
})
