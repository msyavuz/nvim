local function lua_ls_on_init(client)
  local path = vim.tbl_get(client, "workspace_folders", 1, "name")
  if not path then
    return
  end
  client.settings = vim.tbl_deep_extend('force', client.settings, {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    }
  })
end
---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
  filetypes = { "lua" },
  on_init = lua_ls_on_init,
}
