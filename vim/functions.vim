"""""""""""""""""""""""""""""""
"                             "
"      Custom Functions       "
"                             "
"""""""""""""""""""""""""""""""

" Borrowed and inspired from: https://github.com/treasonx/environment/blob/master/vim/functions.vim

" Clean trailing whitespace on save
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Format JSON
function! PrettyJSON()
    :%!json
    set filetype=json
endfun
:command! PrettyJSON :call PrettyJSON()

