vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

	{ import = "plugins.code" },
	{ import = "plugins.ui" },
	{ import = "plugins.git" },
	{ import = "plugins.qol" },
	{ import = "plugins" },
}

require("lazy").setup(plugins)

require("configs")

require("keymaps")
