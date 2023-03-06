require('remaps')

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

-- TreeSitter
local filetypes = {
    'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'rescript', 'php'
}
require('nvim-treesitter.configs').setup({
    autotag = {
        enable = true,
        filetypes = filetypes
    },
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

-- disable wrap
vim.wo.wrap = false

-- set numbering
vim.wo.number = true
vim.wo.rnu = true

-- set tabsize
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- set cusor margin
vim.cmd("set scrolloff=5")
