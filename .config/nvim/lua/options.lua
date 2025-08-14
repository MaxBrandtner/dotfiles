vim.opt.diffopt:append("linematch:60")
vim.o.clipboard = "unnamedplus"
--vim.o.completeopt = "menu,menuone,popup,fuzzy"
vim.o.confirm = true
vim.o.cursorline = true
vim.o.expandtab = false
vim.o.foldcolumn = "0"
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.inccommand = "split"
vim.o.ignorecase = false
vim.o.list = true
vim.opt.listchars = {
    tab = "▏ ",
    trail = "·",
    extends = "»",
    precedes = "«",
}
vim.o.mouse = "nv"
vim.o.number = true
vim.o.pumheight = 10
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shiftround = true
vim.o.shiftwidth = 8
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.tabstop = 8
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.updatetime = 200

vim.g.mapleader = " "

vim.g.editorconfig = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
