-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use({
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    })

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use("mbbill/undotree")
    use("nvim-tree/nvim-tree.lua")
    use("nvim-tree/nvim-web-devicons")
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use('lewis6991/gitsigns.nvim')

    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    })

    use {
        'ThePrimeagen/harpoon',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    use {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    }
end)
