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

-- setup cmp
local cmp = require "cmp"

cmp.setup({
    mapping = {
        ['<C-Space>'] = cmp.mapping.completed
    },
    -- fix for too wide suggestions
    formatting = {
        fields = { "abbr", "menu", "kind" },
        format = function(_entry, item)
            local win_width = vim.api.nvim_win_get_width(0)
            local suggestion_width = math.floor(win_width * 0.20)
            local signature_width = math.floor(win_width * 0.30)

            -- Get the completion entry text shown in the completion window.
            local content = item.abbr

            -- Set the fixed completion window width.
            if suggestion_width then
                vim.o.pumwidth = suggestion_width + signature_width + 10
            end

            -- Truncate the suggestion
            if #content > suggestion_width then
                item.abbr = vim.fn.strcharpart(content, 0, suggestion_width - 3) .. "..."
            else
                item.abbr = content .. (" "):rep(suggestion_width - #content)
            end

            local signature = item.menu or ""

            -- Truncate the signature
            if  #signature > signature_width then
                item.menu = vim.fn.strcharpart(signature, 0, signature_width - 3) .. "..."
            else
                item.menu = signature .. (" "):rep(signature_width - #signature)
            end

            return item
        end,
    }
})

-- lsp configurations
local clang_path = vim.fs.normalize(vim.api.nvim_eval("stdpath('data')") .. '/mason/bin/clangd', {})
require('lspconfig').clangd.setup({
    cmd = { clang_path, '-header-insertion=never' }
})

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
