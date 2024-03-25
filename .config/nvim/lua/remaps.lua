-- To find a mapping syntax, do `:map ^v <mapping>` where <mapping> is your mapping
local keymap = vim.keymap.set

vim.cmd("let mapleader = ' '")

-- lspasaga
keymap('n', '<leader>r', '<cmd>Lspsaga rename<cr>', { noremap = true, silent = true })
keymap('n', '<leader>o', '<cmd>Lspsaga outline<cr>', { noremap = true, silent = true })
keymap('n', '<leader><CR>', '<cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })
keymap('v', '<leader><CR>', '<cmd>Lspsaga range_code_action<CR>', { noremap = true, silent = true })
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { noremap = true, silent = true })
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { noremap = true, silent = true })
keymap("n", "<C-.>", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true })
keymap("i", "<C-Space>", "<cmd>lua print('test')<CR>", { noremap = true, silent = true })

-- y acts like d and c, it yoinks to end of line
-- keymap('n', 'Y', 'y$', { noremap = true })

-- open nerdtree
keymap('n', '<leader>nt', '<cmd>NERDTree<cr>', { noremap = true })

-- ctrl backpace in insert mode
keymap('i', '<c-H>', '<c-\\><c-o>db', { noremap = true })
keymap('i', '<c-BS>', '<c-\\><c-o>db', { noremap = true })

-- format text
function FormatRange()
    vim.lsp.buf.format({
        async = true,
        range = {
            ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
            ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
        }
    })
end

keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<cr><cmd>w<cr>', { noremap = true })
keymap('v', '<leader>f', '<cmd>lua FormatRange()<cr><cmd>w<cr>', { noremap = true })

-- center on chunk down
keymap('n', '}', '}zz', { noremap = true })
keymap('n', '{', '{zz', { noremap = true })

-- reload vimrc
keymap('n', '<leader>so', '<cmd>source $MYVIMRC<cr>', { noremap = true })

-- edit vimrc
keymap('n', '<leader>evr', '<cmd>e $MYVIMRC<cr>', { noremap = true })

-- toggle comment on ctrl slash
require('nvim_comment').setup({
    line_mapping = "<C-/>",
    operator_mapping = "<C-/>",
    comment_empty = false
})

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
