"""""""""""""""""""""
"                   "
"  GUI Appearance   "
"                   "
"""""""""""""""""""""

if has("gui_running")
  if has("autocmd")
    " Automatically resize splits when resizing MacVim window
    autocmd VimResized * wincmd =
  endif
endif


if exists("g:enable_mvim_shift_arrow")
    " mvim shift-arrow-keys
    let macvim_hig_shitf_movement = 1
endif
