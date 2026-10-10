" .vimrc (2006-05-13)

" --- Plugins ------------------------------------------------------------------
if empty(glob('~/.vim/pack/vendor/start/vim-fugitive'))
  silent !git clone --depth 1 https://github.com/tpope/vim-fugitive.git ~/.vim/pack/vendor/start/vim-fugitive
endif

filetype plugin indent on
set nomore

" --- Text Editing ----------------------------------------------------------
set tabstop=4 shiftwidth=4 expandtab
set undodir^=~/.vim/undo//
set backspace=indent,eol,start

" --- HMI -------------------------------------------------------------------
syntax on
colorscheme 4term

set laststatus=2 statusline=%f\ %m%=%l,%c\ %p%%%=
set foldcolumn=0

" --- Auto Commands ----------------------------------------------------------
augroup vimrc
  " Automatically open/close Quickfix window
  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow

  " Spelling and line width
  autocmd FileType gitcommit setlocal spell spelllang=en textwidth=72
  autocmd FileType markdown,text setlocal spell spelllang=en textwidth=80
  autocmd FileType c,go,sh setlocal spell spelllang=en
  autocmd FileType c,go,sh setlocal foldmethod=syntax foldenable foldnestmax=1
  
  " Golang
  autocmd FileType go setlocal equalprg=gofmt\ -w
  autocmd FileType go let &l:makeprg = filereadable('Makefile') ? 'make' : 'go build'
  
  " C
  autocmd FileType c setlocal equalprg=indent
  
  " Makefile
  autocmd FileType make setlocal noexpandtab
  
  " Disable folding for log/json/yaml
  autocmd FileType log,json,yaml setlocal nofoldenable
augroup end
