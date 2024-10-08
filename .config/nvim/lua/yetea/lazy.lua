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

require("lazy").setup({
	{ import = "yetea.plugins" },
	{ import = "yetea.plugins.lang" },
	{ import = "yetea.plugins.utils" },
	{ import = "yetea.plugins.git" },
	{ import = "yetea.plugins.ui" },
	{ import = "yetea.plugins.editor" },
	change_detection = { enabled = false, notify = false },
	ui = { border = "single" },
})
