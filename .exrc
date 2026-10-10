" .exrc - Base configuration for vi/nvi

" --- Editing --------------------------------------------------------
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" --- Display --------------------------------------------------------
set showmatch
set ruler
set searchincr
set verbose

" --- Mappings ------------------------------------------------------
map gg 1G
map gqq {!}fmt -72 -s -p
map gz :!aspell -c %
