set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'project.tar.gz'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
"Plugin 'scrooloose/syntastic'
"Plugin 'OmniCppComplete'
"Plugin 'Syntastic'
"Plugin 'EasyMotion'
"Plugin 'ctrlp.vim'
"Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

filetype on
syntax on
set viminfo+=n~/.vim/viminfo
set foldmethod=syntax
set foldlevel=99
set encoding=utf-8
set tabstop=2

au BufRead,BufnewFile *.ino set filetype=arduino

au BufRead,BufNewFile *.pde set filetype=processing

set omnifunc=syntaxcomplete#Complete
set nocp
colorscheme elflord
set expandtab
set textwidth=79
set wrapmargin=0
set colorcolumn=78
set wrap
set linebreak
set nolist
set fileformat=unix

" Stuff to handle opening multiple files at once in frames from the command
" line.
if argc()==2
  silent vsplit
  silent bn
endif
if argc()==3
  silent vsplit
  silent bn
  silent split
  silent bn
endif
if argc()>=4
  silent vsplit
  silent winc l
  silent bn
  silent split
  silent winc j
  silent b4
  silent winc h
  silent split
  silent winc j
  silent b3
endif

" Diff mode options
if &diff
  set list
endif

" Lets me use jk to navigate a reasonably colored autocomplete menu.
highlight Pmenu ctermfg=White ctermbg=Gray guibg=Black
highlight PmenuSel ctermfg=Yellow ctermbg=Blue guibg=Black

inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" Useful long-ass commands bound to keys.
" First, run ctags in some common environments such as...
" Edison...
noremap <C-F12> :!echo Updating ctags...;ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . ~/Intel/iotdk-ide-win/devkit-x86/sysroots/i586-poky-linux/usr/include<ENTER>
" The current directory...
noremap <C-F11> :!echo Updating ctags...;ctags -R -a --c++-kinds=+p --fields=+iaS --extra=+q .<ENTER>
" A directory of my choosing.
noremap <C-F10> :!echo Updating ctags...;ctags --recurse=yes -a --c++-kinds=+pcdefgmstuv --fields=+ilaimS --extra=+q 

" Scroll binding, which scrolls both windows at once.
noremap <F1> :set scb!<ENTER>

" Execution commands for...
" ...Python...
noremap <F5> :!python %<ENTER>
" ...Processing..
noremap <F6> :!~/processing-3.0b4/processing-java.exe --force --sketch=`pwd \| xargs cygpath -w` --output=~/temp --run<ENTER> 

" leader commands to edit and source vimrc
noremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <leader>sv :so $MYVIMRC<cr>

