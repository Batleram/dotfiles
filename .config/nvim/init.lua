local keymap = vim.api.nvim_set_keymap
-- plugins install
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'preservim/nerdtree'

-- THEMES
Plug 'sainnhe/sonokai'
Plug 'sainnhe/edge'
Plug 'Batleram/uwu.vim'
Plug '4513ECHO/vim-colors-hatsunemiku'
Plug('frenzyexists/aquarium-vim', { ['branch'] = 'develop' })

-- LSP
Plug 'neovim/nvim-lspconfig'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn['TSUpdate'] })
Plug 'tami5/lspsaga.nvim'
Plug 'williamboman/nvim-lsp-installer'

-- COMPLETION
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

-- UTIL
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'terrortylor/nvim-comment'

-- LINTING
Plug 'dense-analysis/ale'

-- QOL
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
vim.call('plug#end')

-- apply color scheme
vim.o.termguicolors = true
-- available themes: default atlantis andromeda shusia maia
vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_enable_italic = 0
vim.g.sonokai_disable_italic_comment = 1
vim.g.edge_style = 'neon'
vim.g.edge_enable_italic = 0
vim.g.edge_disable_italic_comment = 1
vim.g.UwuNR = 1
vim.g.aquarium_style = "light"
-- vim.cmd("colorscheme sonokai")
--vim.cmd("colorscheme edge")
vim.cmd("colorscheme uwu")

-- setup lsp servers
local lsp_installer = require("nvim-lsp-installer")


lsp_installer.on_server_ready(function(server)
    local options = {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        -- on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
    if server.name == "rust-analyzer" then
        options.procMacro.enable = false
    end
    -- if server.name == "emmet_ls" then
    --     options.filetypes = { "html", "javascriptreact", "typescriptreact" }
    -- end
    server:setup(options)
end)


local lspconfig = require('lspconfig')
local pid = vim.fn.getpid()
local omnisharp_bin = "/home/me/.local/bin/omnisharp/run"
lspconfig.omnisharp.setup {
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) };
    on_attach = function(client)
        require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    end
}
lspconfig.emmet_ls.setup { filetypes = { "html", "javascriptreact", "typescriptreact" } }
-- local omnisharp_bin = '/usr/bin/omnisharp'
-- local pid = vim.fn.getpid()
-- require'lspconfig'.omnisharp.setup{
--     cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) };
--     root_dir = lspconfig.util.root_pattern("*.csproj","*.sln");
-- }
--lspconfig.pyright.setup{} --python `npm i -g pyright`
--lspconfig.tsserver.setup{
--    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--} -- js + ts `npm install -g typescript typescript-language-server`
lspconfig.rust_analyzer.setup {} -- rust `pacman -S rust-analyzer
--lspconfig.bashls.setup{} -- bash `yay -S bash-language-server`
--lspconfig.csharp_ls.setup{} -- dotnet tool install --global csharp-ls and add: export PATH="$PATH:/home/me/.dotnet/tools" to .*shrc
--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--    vim.lsp.diagnostic.on_publish_diagnostics, {
--        virtual_text = false
--    }
--)

-- Setup lspsaga
local saga = require 'lspsaga'
saga.init_lsp_saga {
    code_action_keys = {
        quit = "<leader>",
    },
    rename_action_keys = {
        exec = "<leader>",
    },
}
keymap('n', 'K', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })
keymap('n', '<leader>r', '<cmd>Lspsaga rename<cr>', { noremap = true, silent = true })
keymap('n', '<leader><CR>', ':Lspsaga code_action<CR>', { noremap = true, silent = true })
keymap('v', '<leader><CR>', ':Lspsaga range_code_action<CR>', { noremap = true, silent = true })

-- setup nvim-compe
require("luasnip.loaders.from_vscode").lazy_load() -- snippets
local cmp = require 'cmp'
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
        ['<CR>'] = cmp.mapping.confirm({ behaviour = cmp.ConfirmBehavior.Insert, select = false }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", }),
        ['<C-n>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end
        }),
        ['<C-p>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                else
                    vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end
        }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'luasnip' },
        -- { name = "emmet_ls"}
    }
})

-- TreeSitter
local filetypes = {
    'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'rescript', 'php'
}
require('nvim-treesitter.configs').setup({
    autotag = {
        enable = true,
        filetypes = filetypes
    },
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = { "css" }
    }
})
-- parentheses pair
require('nvim-autopairs').setup {}
cmp.event:on('confirm_done', require("nvim-autopairs.completion.cmp").on_confirm_done({ map_char = { tex = '' } }))

-- ale config
-- vim.g.ale_fix_on_save = 1
-- vim.g.ale_fixers = {"prettier", "black", "rustfmt", "intelephense"}
-- vim.g.ale_javascript_prettier_options = '--tab-width 4'
-- vim.g.ale_linters = { cs =  {"OmniSharp"} }



-- Toggle Comment
require('nvim_comment').setup({
    line_mapping = "<C-_>",
    operator_mapping = "<C-_>",
    comment_empty = false
})


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
vim.cmd("set scrolloff=5")

-- autocommands
-- vim.api.nvim_command([[
--     autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- ]])

-- remaps
vim.cmd("let mapleader = ' '")
-- Y acts like D and C, it yoinks to end of line
keymap('n', 'Y', 'y$', { noremap = true })
-- open NERDTree
keymap('n', '<leader>nt', ':NERDTree<CR>', { noremap = true })
-- ctrl backpace in insert mode
keymap('i', '<C-H>', '<C-\\><C-o>db', { noremap = true })
-- format text
keymap('n', '<leader>f', ':lua vim.lsp.buf.formatting()<CR>:w<CR>', { noremap = true })
