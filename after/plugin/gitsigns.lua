require('gitsigns').setup {}
local signs = vim.api.nvim_create_augroup("transparent_signs", { clear = false })
vim.api.nvim_create_autocmd(
    "ColorScheme",
    { pattern = "*", command = "highlight GitsignsAdd guibg=none", group = signs }
)
vim.api.nvim_create_autocmd(
    "ColorScheme",
    { pattern = "*", command = "highlight GitsignsChange guibg=none", group = signs }
)
vim.api.nvim_create_autocmd(
    "ColorScheme",
    { pattern = "*", command = "highlight GitsignsDelete guibg=none", group = signs }
)
