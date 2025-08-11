vim.api.nvim_create_autocmd("FileType", {
    pattern = {"c", "cpp", "h", "hpp"},
    callback = function
        vim.opt_local.expandtab = false
        vim.opt_local.shitwidth = 8
        vim.opt_local.tabstop = 8
        vim.opt_local.softtabstop = 0
    end,
})
