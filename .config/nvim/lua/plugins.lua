return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 'preservim/nerdtree' }

    -- THEMES
    use { 'sainnhe/edge' }
    use { 'Batleram/uwu.vim' }
    use { '4513ECHO/vim-colors-hatsunemiku' }
    use { 'frenzyexists/aquarium-vim' }
    use { 'nvim-tree/nvim-web-devicons' }

    -- lsp autoinstall
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }

    -- cmp
    use {'ms-jpq/coq_nvim', branch='coq'}
    use {'ms-jpq/coq.artifacts', branch='artifacts'}

    -- LSP
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-treesitter/nvim-treesitter', { run = vim.fn['TSUpdate'] } }
    use { 'nvim-treesitter/nvim-treesitter-context' } -- for the stacking of nested menus at the top of the screen
    use { 'lervag/vimtex' }

    -- UTIL
    use { 'windwp/nvim-autopairs' }
    use { 'windwp/nvim-ts-autotag' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'chomosuke/typst-preview.nvim',
        tag = 'v1.*',
        config = function()
            require 'typst-preview'.setup {}
        end,
    }

    -- LINTING
    use { 'folke/trouble.nvim' }

    -- QOL
    use { 'romainl/vim-qf' } -- damn quickfix lists
    use { 'tpope/vim-fugitive' }
end)
