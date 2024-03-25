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

require 'treesitter-context'.setup {
    enable = true,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = nil,
    zindex = 20,
}

-- lspsaga
require "lspsaga".setup({
    outline = {
        layout = 'float'
    },
    lightbulb = {
        virtual_text = false
    }
})

-- parentheses pair
require('nvim-autopairs').setup {}

-- telescope
local actions = require("telescope.actions")
require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",

        }
    },
    defaults ={
        mappings ={
            i = {
                ["<esc>"] = actions.close,
            }
        }
    }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- setup cmp
local cmp = require "cmp"
cmp.setup({
    mapping = {
        ['<C-Space>'] = cmp.mapping.completed
    }
})

-- setup vimtex
vim.g.vimtex_view_general_viewer = 'okular'

-- disable wrap
vim.wo.wrap = false

-- set numbering
vim.wo.number = true
vim.wo.rnu = true

-- set tabsize
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- set cusor margin
vim.cmd("set scrolloff=5")

-- disable mouse
vim.cmd("set mouse=")

-- always show sign column
vim.o.signcolumn = "yes:1"
