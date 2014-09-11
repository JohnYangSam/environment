" Source the vim configuration files so that this .vimrc is
" the equivalent to the combination of all the files.
" Borrowed and Inspired by:
" http://bamgreeneggsandham.com/2013/11/19/vimrc-your-doing-it-wrong/
" Additional example: https://github.com/spf13/spf13-vim/blob/3.0/.vimrc

let s:vim_home = '~/.vim/'

" Descriptions here since inline comments will mess up this list
"    \ 'base.vim',               " Minimum vim settings
"    \ 'functions.vim',          " Custom functions
"    \ 'theme.vim',              " Look, number of lines, bell, and other aesthetics
"    \ 'gui_settings.vim',       " GUI settings (mvim and gvim specific)
"    \ 'settings.vim',           " Miscellaneous settings
"    \ 'leader.vim',             " Customized leader key settings for creating custom key combination namespaces
"    \ 'keymappings.vim',        " Overrides for default key mappings
"    \ 'plugins.vim',            " Neobundle plugins & langs with descriptions
"    \ 'plugin_settings/*.vim'   " Plugin specific settings (one file for each customized plugin)

let config_list = [
    \ 'base.vim',
    \ 'functions.vim',
    \ 'theme.vim',
    \ 'gui_settings.vim',
    \ 'settings.vim',
    \ 'leader.vim',
    \ 'keymappings.vim',
    \ 'plugins.vim',
    \ 'plugin_settings/*.vim'
 \]

for files in config_list
    for f in split(glob(s:vim_home.files), '\n')
        exec 'source '.f
    endfor
endfor

