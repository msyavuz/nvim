---@type vim.lsp.Config
return {
  cmd = { "clangd" },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git'
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}
