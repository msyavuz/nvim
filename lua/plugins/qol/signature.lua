return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    require('lsp_signature').setup(opts)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        require("lsp_signature").on_attach({
          floating_window = false,
          hint_enable = false,
        }, bufnr)
      end,
    })
  end
}
