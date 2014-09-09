"""""""""""""""""""""""""""""""
"                             "
" Neobundle Setup and Plugins "
"                             "
"""""""""""""""""""""""""""""""

" Neobundle vim plugin management setup
" See https://github.com/Shougo/neobundle.vim for more info
"
" To install:
" Launch vim, run :NeoBundleInstall
" or :Unite neobundle/install (required unite.vim)
" or Command run bin/neoinstall or vim +NeoBundleInstall +qall
"

if has('vim_starting')
    set nocompatible " Use Vim instead of Vi defaults

    " Required
    set runtimepath+=~/.vim/bundle/neobundle.vim/   " Required: Bundle location
endif

" Required: Setup
call neobundle#begin(expand('~/.vim/bundle/'))

" Required: Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"""""""""""""""""""""""""""""""
"                             "
"     Place bundles below     "
"                             "
"""""""""""""""""""""""""""""""

" Plugins can be found on github by their URLs
" Bundle '<name here>' -> https://github.com/<name here>

NeoBundle 'Shougo/vimproc.vim', {           " Allows for install/update asyncronously in the Unite Interface
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" From https://github.com/treasonx/environment/blob/master/vim/plugins.vim
NeoBundle 'vim-scripts/L9'                      " VIMScript Programming Libraries
NeoBundle 'MarcWeber/vim-addon-mw-utils'        " VIMScript utils
NeoBundle 'tomtom/tlib_vim'                     " VIMScript tlib utils
NeoBundle 'scrooloose/nerdtree'                 " NERDTree File Manager
NeoBundle 'scrooloose/syntastic'                " Static Analysis for a variety of langauges. See https://github.com/scrooloose/syntastic for configuration
NeoBundle 'vim-scripts/matchit.zip'             " Auto insert closing character
NeoBundle 'kien/ctrlp.vim'                      " Fuzzy File Finder
NeoBundle 'altercatiocvim-colors-solarized'     " Solarized Color Scheme
NeoBundle 'tpope/vim-fugitive'                  " Git tools
NeoBundle 'nvie/vim-togglemouse'                " Allow for mouse toggling
NeoBundle 'Raimondi/delimitMate'                " Closing characters a related delimiters
NeoBundle 'garbas/vim-snipmate'                 " Snippet Expand
NeoBundle 'lukaszb/vim-web-indent'              " Better js and html auto indent
NeoBundle 'hallison/vim-markdown'               " Markdown highlighting
NeoBundle 'wikitopian/hardmode.git'             " Hardcore VIM mode toogle with :call Hardmode() :call EasyMode()
NeoBundle 'kshenoy/vim-signature'               " Show line marks http://vim.wikia.com/wiki/Using_marks
NeoBundle 'tpope/vim-commentary'                " Simpler commenting gcc<count> and gc to comment/uncomment line(s)
NeoBundle 'tristen/vim-sparkup'                 " Sparkup for vim HTML. You can typea CSS selectors plus <C-E> to conver to HTML (and cycle with <C-n>)
NeoBundle 'scrooloose/nerdcommenter.git'        " Better code commenting
NeoBundle 'rking/ag.vim'                        " Grep files using silversearcher (see settings file)
NeoBundle 'christoomey/vim-tmux-navigator'      " Navigate vim and tmux splits
NeoBundle 'bling/vim-airline'                   " Nicer looking status line
NeoBundle 'edkolev/tmuxline.vim'                " Keeps tmux in sync with airline
NeoBundle 'airblade/vim-gitgutter'              " Git status of line changes in the left hand gutter (i.e. +/-)
NeoBundle 'mattn/emmet-vim'                     " HTML auto complete using Ctrl+y
NeoBundle 'nathanaelkane/vim-indent-guides'     " Visual indent guides striped odd and even - may need to set colors for terminal
NeoBundle 'Valloric/YouCompleteMe'              " Autocomplete engine
NeoBundle 'marijnh/tern_for_vim'                " Contexual code complete for JS
NeoBundle 'SirVer/ultisnips'                    " Snippets - may need to remap keys - currently <c-tab> in settings
NeoBundle 'honza/vim-snippets'                  " Standard snippet library

" From Janus
NeoBundle 'mileszs/ack.vim'                     " Ack plugin
NeoBundle 'jeetsukumaran/vim-buffergator'       " `<leader>b` (`\b`) to open a window listing all buffers
NeoBundle 'ap/vim-css-color'                    " Vim color for CSS
" Included above " NeoBundle 'kien/ctrlp.vim'                      " Fuzzy File Finder
" Included above " NeoBundle 'tpope/vim-dispatch'                  " For Vim compilers
NeoBundle 'Lokaltog/vim-easymotion'             " Easier motions in vim: https://github.com/Lokaltog/vim-easymotion
NeoBundle 'tpope/vim-endwise'                   " Helps with certain structures like if...endif
NeoBundle 'tpope/vim-eununch'                   " Vim sugar for Unix shell commands. See: https://github.com/tpope/vim-eunuch
" Included above " NeoBundle 'tpope/vim-fugitive'                  " Git tools
NeoBundle 'mattn/gist-vim',{'depends': 'mattn/webapi-vim'} " Vim scripts for creating gists. See: https://github.com/mattn/gist-vim
NeoBundle 'sjl/gundo.vim'                       " Visualize your undo tree: https://github.com/sjl/gundo.vim
NeoBundle 'michaeljsmith/vim-indent-object'     " Helpful for vim/python scripts
NeoBundle 'rgarver/Kwbd.vim'                    " Add a buffer close to vim that doesn't close the window: https://github.com/rgarver/Kwbd.vim
" Included above " NeoBundle 'vim-scripts/matchit.zip'             " Auto insert closing character
NeoBundle 'terryma/vim-multiple-cursors'        " Multiple cursors like Sublime
NeoBundle 'chrisbra/NrrwRgn'                    " Narrow view. :NR -Open a select region in a new window and other narrow commands: https://github.com/chrisbra/NrrwRgn
" Included above " NeoBundle 'scrooloose/nerdcommenter.git'        " Better code commenting
" Included above " NeoBundle 'scrooloose/nerdtree'                 " NERDTree File Manager
NeoBundle 'tpope/vim-repeat'                    " Helps for plugins to hooks into .
" Included above " NeoBundle 'garbas/vim-snipmate'                 " Snippet Expand
NeoBundle 'ervandew/supertab'                   " Tab completion - may conflict with other plugins
NeoBundle 'tpope/vim-surround'                  " Helps with vim surroundings
" Included above " NeoBundle 'scrooloose/syntastic'                " Static Analysis for a variety of langauges. See https://github.com/scrooloose/syntastic for configuration
NeoBundle 'majutsushi/tagbar'
" Included above " NeoBundle 'tomtom/tlib_vim'                     " VIMScript tlib utils
NeoBundle 'tpope/vim-unimpaired'                " Complementary mappings
NeoBundle 'MarcWeber/vim-addon-mw-utils'        " interpret a file by function and cache file automatically: https://github.com/MarcWeber/vim-addon-mw-utils
" Included above " NeoBundle 'honza/vim-snippets'                  " Standard snippet library
NeoBundle 'ntpeters/vim-better-whitespace'      " Highlights trailing whitespace in red and provides :StripWhitespace to fix it
NeoBundle 'vim-scripts/vimwiki'                 " Personal Wiki for Vim: http://www.vim.org/scripts/script.php?script_id=2226
NeoBundle 'thinca/vim-visualstart'              " Not quite sure what this does but included in Janus
NeoBundle 'skalnik/vim-vroom'                   " Allows Ruby test running: https://github.com/skalnik/vim-vroom
NeoBundle 'mattn/web-api'                       " Vim interface for Web APIs
NeoBundle 'itspriddle/ZoomWin'                  " Zooming: https://github.com/itspriddle/ZoomWin

" Languages
NeoBundle 'vim-scripts/Arduino-syntax-file'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'jimenezrick/vimerl' " Erlang
NeoBundle 'tpope/vim-git'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'tpope/vim-haml'
NeoBundle 'wlangstroth/vim-haskell'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'groenewege/vim-less'
NeoBundle 'tpope/vim-liquid'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'sunaku/vim-ruby-minitest'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'mmalecki/vim-node.js'
NeoBundle 'ajf/puppet-vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'depuracao/vim-rdoc'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'rosstimson/scala-vim-support'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'timcharper/textile.vim'
NeoBundle 'hdima/python-syntax'

" Test

"""""""""""""""""""""""""""""""
"                             "
"        End of bundles       "
"                             "
"""""""""""""""""""""""""""""""

call neobundle#end()

filetype plugin indent on " Required

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
