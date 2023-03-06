-- To find a mapping syntax, do `:map ^v <mapping>` where <mapping> is your mapping
local keymap = vim.api.nvim_set_keymap
require('lspsaga').setup({})

vim.cmd("let mapleader = ' '")

-- lspasaga
keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { noremap = true, silent = true })
keymap('n', '<leader>r', '<cmd>Lspsaga rename<cr>', { noremap = true, silent = true })
keymap('n', '<leader><CR>', '<cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })
keymap('v', '<leader><CR>', '<cmd>Lspsaga range_code_action<CR>', { noremap = true, silent = true })

-- y acts like d and c, it yoinks to end of line
keymap('n', 'Y', 'y$', { noremap = true })

-- open nerdtree
keymap('n', '<leader>nt', '<cmd>NERDTree<cr>', { noremap = true })

-- ctrl backpace in insert mode
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

-- reload vimrc
keymap('n', '<leader>so', '<cmd>so $MYVIMRC<cr>', { noremap = true })

-- edit vimrc
keymap('n', '<leader>evr', '<cmd>e $MYVIMRC<cr>', { noremap = true })

-- toggle comment on ctrl slash
require('nvim_comment').setup({
    line_mapping = "<C-/>",
    operator_mapping = "<C-/>",
    comment_empty = false
})

