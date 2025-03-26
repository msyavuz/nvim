return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    settings = {
      expose_as_code_action = "all",
      tsserver_file_preferences = {
        importModuleSpecifierPreference = "non-relative",
        importModuleSpecifierEnding = "minimal"
      },
      tsserver_plugins = {
        "@styled/typescript-styled-plugin",
      }
    }
  },
}
