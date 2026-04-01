vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'codesnap.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('codesnap.nvim') end
      vim.fn.system('make -C ' .. vim.fn.stdpath('data') .. '/site/pack/core/opt/codesnap.nvim')
    end
  end
})

vim.pack.add({
  'https://github.com/mistricky/codesnap.nvim',
}, { load = function() end })

vim.api.nvim_create_user_command('CodeSnap', function(opts)
  vim.cmd.packadd('codesnap.nvim')
  require("codesnap").setup({ watermark = "" })
  vim.cmd('CodeSnap' .. (opts.args ~= '' and ' ' .. opts.args or ''))
end, { range = true, nargs = '*' })
