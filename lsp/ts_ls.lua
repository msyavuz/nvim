---@type vim.lsp.Config
return {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    plugins = {
      {
        name = "typescript-eslint",
        location = "typescript-eslint",
      },
      {
        name = "@styled/typescript-styled-plugin",
        location = "@styled/typescript-styled-plugin",
      }
    },
    hostInfo = "neovim",
  },
}
