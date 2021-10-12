" nerdTree
autocmd vimenter * NERDTree
let NERDTreeWinSize = 40
"  close nerdTree with vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
	  \ && b:NERDTree.isTabTree()) | q | endif

