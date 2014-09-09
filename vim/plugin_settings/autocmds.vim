" AutoCmd Settings
" Borrowed from: https://github.com/carlhuda/janus/blob/master/janus/vim/core/before/plugin/autocmds.vim

if has("autocmd")
  if exists("g:autosave_on_blur")
    au FocusLost * silent! wall
  endif
endif
