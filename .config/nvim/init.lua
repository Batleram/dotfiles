local keymap = vim.api.nvim_set_keymap
-- plugins install
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug 'preservim/nerdtree'
    --   Plug 'sainnhe/sonokai'
    Plug 'sainnhe/edge'
    Plug 'tmsvg/pear-tree'
    --lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'tree-sitter/tree-sitter'
    
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    Plug 'dense-analysis/ale'
vim.call('plug#end')

-- apply color scheme
vim.o.termguicolors = true
-- -- available themes: default atlantis andromeda shusia maia
-- vim.g.sonokai_style = 'atlantis'
-- vim.g.sonokai_enable_italic = 0
-- vim.g.sonokai_disable_italic_comment = 1
-- vim.cmd("colorscheme sonokai")
-- available themes: default aura neon
vim.g.edge_style = 'neon'
vim.g.edge_enable_italic = 0
vim.g.edge_disable_italic_comment = 1
vim.cmd("colorscheme edge")

-- setup lsp servers
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{} --python `npm i -g pyright`
lspconfig.tsserver.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
} -- js + ts `npm install -g typescript typescript-language-server`
lspconfig.rust_analyzer.setup{} -- rust `pacman -S rust-analyzer
lspconfig.bashls.setup{} -- bash `yay -S bash-language-server`

-- setup lsp saga
local saga = require('lspsaga')
saga.init_lsp_saga()
--hover doc
keymap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", {silent=true,noremap = true})

-- setup nvim-compe
local cmp = require'cmp'
cmp.setup({
     snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'vsnip' }
    }
})

-- ale config
vim.g.ale_fix_on_save = 1
vim.g.ale_fixers = {"prettier",  "black", "rustfmt"}
vim.g.ale_javascript_prettier_options = '--tab-width 4'

-- pear tree
vim.g.pear_tree_repeatable_expand = 0

-- disable wrap
vim.wo.wrap = false

-- set numbering
vim.wo.number = true
vim.wo.rnu = true

-- set tabSize
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- set cusor margin
vim.wo.scrolloff=3

-- remaps
-- Y acts like D and C, it yoinks to end of line
keymap('n', 'Y', 'y$', {noremap = true})

