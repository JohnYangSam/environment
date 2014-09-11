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

" Inspirted and borrowed from: https://github.com/carlhuda/janus/blob/master/janus/vim/core/before/plugin/janus.vim
function! Add_mapping(name, mapping_command, mapping_keys, ...)
	  let mapping_command = join(a:000)
    let mapping_list = [a:mapping_command, a:mapping_keys, mapping_command]
    exe join(mapping_list)
endfunction
