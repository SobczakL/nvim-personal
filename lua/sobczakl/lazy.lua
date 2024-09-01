require("lazy").setup({
    {
        "wbthomason/packer.nvim",
        "mbbill/undotree",
        "nvim-tree/nvim-tree.lua",
        "nvim-tree/nvim-web-devicons",
        "numToStr/Comment.nvim",
        "lewis6991/gitsigns.nvim",
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = {'nvim-lua/plenary.nvim'}
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'rose-pine/neovim',
        name = "rose-pine"
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
        }
    },
    {
        'akinsho/bufferline.nvim',
        tag = "*",
        dependencies = {'nvim-tree/nvim-web-devicons'}
    },
    {
        "stevearc/conform.nvim",
        opts = {},
    },
    {
        'akinsho/toggleterm.nvim', version = "*", config = true
    }
})
