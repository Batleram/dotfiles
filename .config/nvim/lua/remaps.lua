-- To find a mapping syntax, do `:map ^v <mapping>` where <mapping> is your mapping

vim.cmd("let mapleader = ' '")

-- Show error info
vim.keymap.set("v", "K", "<cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true, silent = true})

-- noh esc in normal mode
vim.keymap.set('n', '<esc>', '<cmd>noh<cr>', { noremap = true })

-- open nerdtree
vim.keymap.set('n', '<leader>nt', '<cmd>NERDTree<cr>', { noremap = true })

-- ctrl backpace in insert mode
vim.keymap.set('i', '<c-H>', '<c-\\><c-o>db', { noremap = true })
vim.keymap.set('i', '<c-BS>', '<c-\\><c-o>db', { noremap = true })

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

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { noremap = true })
vim.keymap.set('v', '<leader>f', FormatRange, { noremap = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true })
vim.keymap.set("n", '<leader><Space>', vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set("n", '<C-.>',  vim.lsp.buf.code_action, { noremap = true, silent = true })


-- center on chunk down
vim.keymap.set('n', '}', '}zz', { noremap = true })
vim.keymap.set('n', '{', '{zz', { noremap = true })

-- edit vimrc
vim.keymap.set('n', '<leader>evr', '<cmd>e $MYVIMRC<cr>', { noremap = true })

-- telescope
local builtin = require('telescope.builtin')
local telescope = require("telescope")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<cr>", {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- quickfix list editing
-- cba to convert to vimscript
vim.api.nvim_exec(
[[ 
    " Normal: `dd` removes item from the quickfix list.

    " Visual: `d` removes all selected items, gk keeps all selected items
    augroup custom_qf_mapping
          autocmd!
      autocmd FileType qf nnoremap <buffer> dd :.Reject<CR>
      autocmd FileType qf nnoremap <buffer> dj :.Reject<CR>
      autocmd FileType qf nnoremap <buffer> dk :.Reject<CR>

      autocmd FileType qf xnoremap <buffer> d  :'<,'>Reject<CR>
      autocmd FileType qf xnoremap <buffer> dh :'<,'>Reject<CR>
      autocmd FileType qf xnoremap <buffer> dl :'<,'>Reject<CR>

      autocmd FileType qf nnoremap <buffer> gk :.Keep<CR>
      autocmd FileType qf xnoremap <buffer> gk :'<,'>Keep<CR>

      autocmd FileType qf xnoremap <buffer> u  :Restore<CR>
    augroup END
]], false)


-- quickfix navigation
vim.keymap.set('n', '<M-]>', "<cmd>cnext<cr>")
vim.keymap.set('n', '<M-[>', "<cmd>cprevious<cr>")
