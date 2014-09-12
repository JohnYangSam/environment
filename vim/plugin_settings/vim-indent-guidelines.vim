" See: https://github.com/nathanaelkane/vim-indent-guides
" You may need to remap the <tab> leader key for terminal vim
let g:indent_guides_enable_on_vim_startup = 1

" Set custom solarized colors from:
" https://github.com/altercation/solarized/tree/master/osx-terminal.app-colors-solarized
let g:indent_guides_auto_colors = 0
" let g:indent_guides_guide_size = 1
" hi IndentGuidesOdd  ctermbg=255 " use the automatic color
hi IndentGuidesEven ctermbg=236 " black color"

let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
