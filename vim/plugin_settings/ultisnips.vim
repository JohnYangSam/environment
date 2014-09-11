" See: https://github.com/SirVer/ultisnips
" More examples: https://github.com/treasonx/environment/blob/master/vim/plugin_settings/ultisnips.vim


" Track the engine.
" Plugin 'SirVer/ultisnips' (already installed)

" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets' (already installed)

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-tab>" " Use Ctrl+tab for snippet completion
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

