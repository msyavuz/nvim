return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function(plugin)
    local install_cmd = { "npx", "--yes", "yarn", "install" }
    local restore_cmd = { "git", "restore", "package.json" }
    local app_dir = plugin.dir .. "/app"
    local plugin_dir = plugin.dir

    if vim.fn.executable("npx") == 1 then
      vim.system(install_cmd, { cwd = app_dir }, function(res)
        if res.code ~= 0 then
          vim.notify("markdown-preview.nvim: yarn install failed", vim.log.levels.ERROR)
        else
          vim.system(restore_cmd, { cwd = plugin_dir }, function(restore_res)
            if restore_res.code ~= 0 then
              vim.notify(
                "markdown-preview.nvim: git restore failed for package.json",
                vim.log.levels.WARN
              )
            end
          end)
        end
      end)
    else
      vim.fn["mkdp#util#install"]()
      vim.system(restore_cmd, { cwd = plugin_dir }, function(restore_res)
        if restore_res.code ~= 0 then
          vim.notify("markdown-preview.nvim: git restore failed for package.json", vim.log.levels.WARN)
        end
      end)
    end
  end,
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}
