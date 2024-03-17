return {
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- lsp cmp
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
}
