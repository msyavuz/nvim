local opt = vim.opt
local api = vim.api
--cursor

api.nvim_set_hl(0, "InsertCursor", { bg = "#96CBFE" })

opt.guicursor = "i:block-InsertCursor"

--hlsearch
opt.hlsearch = false

--line numbers
opt.number = true
opt.relativenumber = true

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
opt.termguicolors = true

-- Tabwidth
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

opt.scrolloff = 16

-- Center
-- Reference: http://vim.wikia.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen
-- local group = vim.api.nvim_create_augroup("VCenterCursor", { clear = true })
--
-- vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "WinNew", "VimResized" }, {
--     group = group,
--     pattern = { "*", "*.*" },
--     command = "let &scrolloff=(winheight(win_getid())/2) + 1",
-- })

opt.clipboard = "unnamedplus"

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.filetype.add({
	extension = {
		templ = "templ",
	},
	pattern = {
		["*/templates/**/*.html"] = {
			priority = math.huge,
			"htmldjango",
		},
	},
})
local filetype_group = vim.api.nvim_create_augroup("FiletypeChange", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	-- callback = function(bufnr)
	-- 	--templates
	-- 	vim.filetype.add({
	-- 		extension = {
	-- 			templ = "templ",
	-- 		},
	-- 		pattern = {
	-- 			["*/templates/**/*.html"] = {
	-- 				priority = math.huge,
	-- 				"htmldjango",
	-- 			},
	-- 		},
	-- 	})
	-- end,
	group = filetype_group,
	pattern = "*/templates/**/*.html",
	command = "set filetype=htmldjango",
})

-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrw = 1
