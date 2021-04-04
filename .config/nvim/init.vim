"install plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier'
Plug 'tmsvg/pear-tree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'OmniSharp/omnisharp-vim'

"c++
Plug 'justmao945/vim-clang'
Plug 'rhysd/vim-clang-format'
"finish installing plugins
call plug#end()


"apply color scheme
if has('termguicolors')
  set termguicolors
endif
" available themes: default, atlantis andromeda shusia maia
let g:sonokai_style = 'atlantis'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

" nerdTree
autocmd vimenter * NERDTree
let NERDTreeWinSize = 40
"  close nerdTree with vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
	  \ && b:NERDTree.isTabTree()) | q | endif


" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#config#use_tabs = 'true'
let g:prettier#config#tab_width = '4'

" pear tree
let g:pear_tree_repeatable_expand = 0

" disable wrap
set wrap!

" set numbering
set number
set rnu

" set tabSize
set tabstop=4

" set cusor margin
set scrolloff=3

" c++ auto format
let g:clang_format#auto_format = 1
let g:clang_format#style_options = {
	  \ "AccessModifierOffset" : -4,
	  \ "AllowShortIfStatementsOnASingleLine" : "true",
	  \ "AlwaysBreakTemplateDeclarations" : "true",
	  \ "Standard" : "C++11",
	  \ "BreakBeforeBraces" : "Stroustrup",
	  \ "IndentWidth": 4}


" vimtex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'


