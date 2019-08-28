call plug#begin('~/.vim/plugged')

Plug 'tomasiser/vim-code-dark'

" Go lang
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

" Keyword completion
Plug 'shougo/neocomplete.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tree explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'majutsushi/tagbar'

" Code navigation
Plug 'easymotion/vim-easymotion'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Syntax checking
Plug 'scrooloose/syntastic'

" Search tool
Plug 'mileszs/ack.vim'

" Mutiple selection
Plug 'terryma/vim-multiple-cursors'

call plug#end()

