local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require('toggleterm').setup {
            direction = 'float',
            hide_numbers = true,
            float_opts = {
                border = "curved",
                winblend = 0,
            },
        }
    end }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use { 'catppuccin/nvim', as = 'catppuccin' }

    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- lsp and cmp
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',

        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',

        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',

        -- Progress Indicator
        'j-hui/fidget.nvim',
    }


    if packer_bootstrap then
        require('packer').sync()
    end
end)
