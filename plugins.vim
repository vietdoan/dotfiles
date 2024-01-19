call plug#begin('~/.vim/plugged')

" Vim color Schemes
" Plug 'tomasiser/vim-code-dark'
" Plug 'kristijanhusak/vim-hybrid-material'
Plug 'fatih/molokai'

" Go lang
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tree explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Commenter
Plug 'scrooloose/nerdcommenter'

" Adds icons
Plug 'ryanoasis/vim-devicons'

" comment stuff out
Plug 'tpope/vim-commentary'

" coc-nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" View and search LSP symbols, tags in Vim
Plug 'liuchengxu/vista.vim'

Plug 'github/copilot.vim'

Plug 'rust-lang/rust.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'jparise/vim-graphql'

call plug#end()

