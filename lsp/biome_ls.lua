---@type vim.lsp.Config
return {
  cmd = { "biome", "lsp-proxy" },
  root_markers = { "biome.json", "biome.jsonc" },
  filetypes = {
    'astro',
    'css',
    'graphql',
    'javascript',
    'javascriptreact',
    'json',
    'jsonc',
    'svelte',
    'typescript',
    'typescript.tsx',
    'typescriptreact',
    'vue',
  },
}
