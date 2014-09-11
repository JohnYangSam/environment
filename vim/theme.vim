"""""""""""""""""""""
"                   "
"    Appearance     "
"                   "
"""""""""""""""""""""

" Color Scheme
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
" colorscheme solarized set this after plugins

" Font
set guifont=Monaco:h13

" Other Appearance
set ruler          " Always show current position
set cul            " Highlight current line
set hlsearch       " Highlight search
set cmdheight=2    " The commandbar height
" set relativenumber " Relative line numbers
set number         " Show line numbers"
set nohidden       " Don't unload buffer when opening a file after changes haven't been saved. See: http://usevim.com/2012/10/19/vim101-set-hidden/
set nolazyredraw   " Don't redraw while executing macros
set showmatch      " Show matching bracets when text indicator is over them
set laststatus=2   " Always have a status bar
set showcmd        " Show information about the current command
syntax enable      " Enable syntax highlighting

highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

" Stop audible bell beeping
set noerrorbells
set vb
set t_vb="."

au BufNewFile,BufRead *.ejs set filetype=html
