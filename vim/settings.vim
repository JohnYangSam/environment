"""""""""""""""""""""""""""""""
"                             "
"   Miscellanoues Settings    "
"                             "
"""""""""""""""""""""""""""""""

" Miscellaneous Settings
" Inspired from multiple sources including:
" https://github.com/carlhuda/janus/blob/master/janus/vim/core/before/plugin/settings.vim
"

" Tab settings
set noexpandtab
set shiftwidth=2                            " spaces per a tab when shifting
set tabstop=2                               " spaces per a tab when
set softtabstop=2                           " spaces for a tab in insert mode
au FileType python setl sw=4 sts=4 ts=4 et  " special tabbing for python
set shiftround                              " always indent by multiple of shiftwidth
set smarttab                                " uses shiftwidth instead of tab stop at the beginning of lines: https://mail.python.org/pipermail/python-list/2007-September/429072.html

set nowrap                      " don't wrap lines
" set backspace=indent,eol,start  " backspace through everything insert mode

" List chars
set list                          " show invisible characters
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line  continues beyond the left of the screen

set autoread                    " Set to auto read when a file is changed from the outside
set scrolloff=6                 " Start scrolling 5 lines before edge of viewport

" Search
set hlsearch                    " Highlight matches
set ignorecase                  " Ignore case when searching
set smartcase                   " ... unless they contain at least one capital letter (from janus)
set incsearch                   " Incremental search (start when you enter a character) like a modern webbrowser
set noerrorbells                " Disable error bells

" Use system clipboard
" set clipboard=unnamed

" Enable filetype plugin
" filetype explanation can be found here: http://vimdoc.sourceforge.net/htmldoc/filetype.html
filetype plugin on
filetype indent on
filetype on
syntax enable

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable error bells
set noerrorbells

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Ack requires ack command
if executable("ack")
  " use default config
elseif executable("ack-grep")
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
elseif executable("ag")
  let g:ackprg="ag --nocolor --nogroup --column"
else
  " call janus#disable_plugin("ack", "The ack program is not installed")
endif


set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Reload .vimrc when it is edited
autocmd! bufwritepost vimrc source ~/.vimrc
