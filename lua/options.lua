local opt = vim.opt

-- Cursor
vim.api.nvim_set_hl(0, "InsertCursor", { bg = "#96CBFE" })
opt.guicursor = "i:block-InsertCursor"

opt.hlsearch = false
opt.number = true
opt.relativenumber = true
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = "menuone,noselect"
opt.termguicolors = true

-- Tabs
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

opt.conceallevel = 1
opt.scrolloff = 16
opt.splitright = true
opt.clipboard = "unnamed,unnamedplus"
opt.fillchars = { eob = " " }
opt.backupcopy = "yes"

-- Diagnostics
vim.diagnostic.config({ virtual_text = true, float = { source = true } })
