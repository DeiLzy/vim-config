let mapleader = ";"
let g:mapleader = ";"
set mouse=a

cnoremap <C-n> <down>
cnoremap <C-p> <up>

set clipboard+=unnamed

set guifont=Hasklug\ Nerd:h17

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

" foldexpr
set nofoldenable
set fillchars=fold:\
set foldtext=CustomFoldText()
setlocal foldexpr=GetPotionFold(v:lnum)
function! GetPotionFold(lnum)
  if getline(a:lnum) =~? '\v^\s*$'
    return '-1'
  endif
  let this_indent = IndentLevel(a:lnum)
  let next_indent = IndentLevel(NextNonBlankLine(a:lnum))
  if next_indent == this_indent
    return this_indent
  elseif next_indent < this_indent
    return this_indent
  elseif next_indent > this_indent
    return '>' . next_indent
  endif
endfunction
function! IndentLevel(lnum)
  return indent(a:lnum) / &shiftwidth
endfunction
function! NextNonBlankLine(lnum)
  let numlines = line('$')
  let current = a:lnum + 1
  while current <= numlines
    if getline(current) =~? '\v\S'
      return current
    endif
    let current += 1
  endwhile
  return -2
endfunction
function! CustomFoldText()
  " get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif
  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr))
  return line . expansionString . foldSizeStr . foldLevelStr
endfunction

" " Ale
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'javascript': ['eslint', 'prettier'],
" \   'typescript': ['eslint', 'prettier'],
" \   'css': ['eslint', 'prettier'],
" \   'less': ['eslint', 'prettier'],
" \   'tsx': ['eslint', 'prettier'],
" \   'jsx': ['eslint', 'prettier'],
" \   'vue': ['eslint', 'prettier'],
" \   'scss': ['eslint', 'prettier'],
" \}
" " Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1



" emmet
let g:user_emmet_settings = {
      \  'variables': {'lang': 'ja'},
      \  'html': {
        \    'default_attributes': {
          \      'option': {'value': v:null},
          \      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
          \    },
          \    'snippets': {
            \      'html:5': "<!DOCTYPE html>\n"
            \              ."<html lang=\"${lang}\">\n"
            \              ."<head>\n"
            \              ."\t<meta charset=\"${charset}\">\n"
            \              ."\t<title></title>\n"
            \              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
            \              ."</head>\n"
            \              ."<body>\n\t${child}|\n</body>\n"
            \              ."</html>",
            \    },
            \  },
            \}

" 基本配置
lua require('setting')
