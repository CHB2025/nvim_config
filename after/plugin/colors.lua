require('rose-pine').setup({
    disable_background = true
})

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

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

ColorMyPencils()
