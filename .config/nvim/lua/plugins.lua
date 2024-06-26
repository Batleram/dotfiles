return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 'preservim/nerdtree' }

    -- THEMES
    use { 'sainnhe/sonokai' }
    use { 'sainnhe/edge' }
    use { 'Batleram/uwu.vim' }
    use { '4513ECHO/vim-colors-hatsunemiku' }
    use { 'frenzyexists/aquarium-vim' }
    use { 'nvim-tree/nvim-web-devicons' }

    -- LSP-Zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- LSP
    use { 'nvim-treesitter/nvim-treesitter', { run = vim.fn['TSUpdate'] } }
    use { 'nvim-treesitter/nvim-treesitter-context' }
    use { 'lervag/vimtex' }

    -- UTIL
    use { 'windwp/nvim-autopairs' }
    use { 'windwp/nvim-ts-autotag' }
    use { 'terrortylor/nvim-comment' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- LINTING
    use { 'folke/trouble.nvim' }

    -- QOL
    use {'romainl/vim-qf' } -- damn quickfix lists
    use { 'tpope/vim-fugitive' }
    use { 'mhinz/vim-signify' }
    use { 'christoomey/vim-tmux-navigator' }
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" }
        }
    })
    use { 'lewis6991/gitsigns.nvim' }
end)
