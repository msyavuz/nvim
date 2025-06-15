---
local npm_root = vim.fn.trim(vim.fn.system("npm root -g"))
print("NPM Global Root: " .. npm_root)

---@type vim.lsp.Config
return {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    plugins = {
      {
        name = "typescript-eslint",
        location = npm_root .. "/typescript-eslint",
      },
      {
        name = "@styled/typescript-styled-plugin",
        location = npm_root .. "/@styled/typescript-styled-plugin",
      }
    },
    hostInfo = "neovim",
  },
}
