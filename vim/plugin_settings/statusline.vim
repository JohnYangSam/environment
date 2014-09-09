" Status line customizations
" Borrowed and inspired from: https://github.com/carlhuda/janus/blob/master/janus/vim/core/before/plugin/statusline.vim
if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif
