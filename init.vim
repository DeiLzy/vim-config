let mapleader = ";"
let g:mapleader = ";"
set mouse=a
 
cnoremap <C-n> <down>
cnoremap <C-p> <up>

set clipboard+=unnamed

" ========= gitblame settings ==========
let g:gitblame_enabled = 1
let g:gitblame_message_template = '     ◆ <summary> • <date> • <author>     '
let g:gitblame_date_format = '%r'
highlight default link Visual default

" Give more space for displaying messages.
set cmdheight=2

set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
syntax on
" colorscheme onedark

" Themeset nocompatible
set laststatus=2

" github copilot config
imap <silent><script><expr> <C-e> copilot#Accept('\<CR>')
let g:copilot_no_tab_map = v:true

" 基本配置
lua require('setting')
