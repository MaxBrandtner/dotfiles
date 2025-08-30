vim.api.nvim_create_autocmd("FileType", {
	pattern = {"c", "cc", "cpp", "h", "hpp"},
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.shiftwidth = 8
		vim.opt_local.tabstop = 8
		vim.opt_local.softtabstop = 0
	end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = "gcc/*/*.md",
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 0
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"markdown"},
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 4
		vim.opt_local.linebreak = true
		vim.opt_local.tabstop = 4
		vim.opt_local.wrap = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"latex", "tex"},
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.expandtab = true
		vim.opt_local.wrap = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"json"},
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"html", "htmldjango", "xml", "svg"},
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})
