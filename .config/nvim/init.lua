local keymap = vim.api.nvim_set_keymap
-- plugins install
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug 'preservim/nerdtree'

    -- THEMES
    --   Plug 'sainnhe/sonokai'
    Plug 'sainnhe/edge'
    Plug 'windwp/nvim-autopairs'
    -- LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'tree-sitter/tree-sitter'
    Plug 'tami5/lspsaga.nvim'
    
    -- COMPLETION
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

    -- LINTING
    Plug 'dense-analysis/ale'

    -- QOL
    Plug 'tpope/vim-fugitive'
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
lspconfig.csharp_ls.setup{} -- dotnet tool install --global csharp-ls and add: export PATH="$PATH:/home/me/.dotnet/tools" to .*shrc
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

-- Setup lspsaga
local saga = require 'lspsaga'
saga.init_lsp_saga{
    code_action_keys = {
        quit="<c-c>",
    },
    rename_action_keys = {
        exec="<tab>",
    },
}
keymap('n', 'K', ':Lspsaga hover_doc<CR>',{noremap = true, silent=true})
keymap('n', '<a-r>', '<cmd>Lspsaga rename<cr>',{noremap = true, silent=true})
keymap('n', '<a-cr>', ':Lspsaga code_action<CR>', {noremap = true, silent=true})
keymap('v', '<a-cr>', ':Lspsaga range_code_action<CR>', {noremap = true, silent=true})

-- setup nvim-compe
local cmp = require'cmp'
cmp.setup({
     snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ behaviour = cmp.ConfirmBehavior.Insert, select = true }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {"i","s",}),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), {"i","s",}),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'luasnip' }
    }
})
-- parentheses pair
require('nvim-autopairs').setup{}
cmp.event:on( 'confirm_done', require("nvim-autopairs.completion.cmp").on_confirm_done({  map_char = { tex = '' } }))

-- ale config
vim.g.ale_fix_on_save = 1
vim.g.ale_fixers = {"prettier",  "black", "rustfmt"}
vim.g.ale_javascript_prettier_options = '--tab-width 4'




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

