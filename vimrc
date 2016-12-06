set nocompatible                " be iMproved
filetype off                    " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"my Bundle here:
Bundle 'scrooloose/nerdtree'
"..................................
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"......................................
filetype plugin indent on
nnoremap <silent> <F5> :NERDTree<CR>
