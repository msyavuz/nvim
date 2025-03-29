return {
  'saghen/blink.cmp',
  event = "InsertEnter",
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  version = '1.*',
  opts = {
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
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lazydev = {
          enabled = true,
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 90,
        },
      },
    },
    signature = { enabled = true },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
}
