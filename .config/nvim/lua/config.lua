require('remaps')

-- apply color scheme
vim.o.termguicolors = true
-- available themes: default atlantis andromeda shusia maia
vim.g.edge_enable_italic = 0
vim.g.edge_disable_italic_comment = 1
vim.g.UwuNR = 1
vim.g.aquarium_style = "light"
-- vim.cmd("colorscheme sonokai")
--vim.cmd("colorscheme edge")
vim.cmd("colorscheme uwu")
vim.cmd('hi! link CurSearch Search') -- laggy colorscheme sometimes when scrolling with highlights

-- fold things
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

-- TreeSitter
require('nvim-treesitter.configs').setup({
    autotag = {
        enable = true,
        filetypes = {
            'html',
            'javascript',
            'javascriptreact',
            'typescriptreact',
            'svelte',
            'vue',
            'rescript',
            'php',
        }
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = { "css" }
    },
    ensure_installed = {
        'javascript',
        'typescript',
        'c',
        'cpp',
        'lua',
        'vimdoc',
        'proto',
        'vim',
        'sql',
        'scss',
        'html',
        'make',
        'cmake',
        'bash'
    }
})

require('treesitter-context').setup {
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
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            }
        },
        layout_strategy = "vertical",

    }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- signify set update interval
vim.g.updatetime = 100

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

-- enable coq
vim.g.coq_settings = {
    auto_start = 'shut-up'
}
