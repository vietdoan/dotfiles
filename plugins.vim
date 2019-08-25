call plug#begin('~/.vim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'shougo/neocomplete.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

