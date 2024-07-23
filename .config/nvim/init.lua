require('plugins')
require('config')

local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

lsp.nvim_workspace()

lsp.setup()

-- lsp configurations
local clang_path = vim.fs.normalize(vim.api.nvim_eval("stdpath('data')") .. '/mason/bin/clangd', {})
require('lspconfig').clangd.setup({
    cmd = { clang_path, '-header-insertion=never'}
})
