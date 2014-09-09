" Borrowed from: https://github.com/Valloric/YouCompleteMe
" User arrow keys
let g:ycm_key_list_select_completion = ['<Down>', '<Enter>']
let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_key_invoke_completion = ['<C-Space']    " Space to invoke the completion

" only show when I hit tab
let g:ycm_key_invoke_completion = '<C-p>'
let g:ycm_auto_trigger=0
let g:ycm_register_as_syntastic_checker = 1
" Don't show preview
let g:ycm_add_preview_to_completeopt = 0
" add omnicomplete options
let g:ycm_cache_omnifunc = 0
set completeopt-=preview
