require('nvim-treesitter.configs').setup {
    ensure_installed = {"help", "javascript", "typescript", "c", "lua", "rust"},

    sync_installed = false,

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldmethod = 'expr'
vim.o.foldenable = false
