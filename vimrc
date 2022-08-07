so ~/.vim/plugins.vim
syntax enable
filetype plugin indent on
set encoding=utf8
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4
set expandtab       " tabs are spaces
set number          " show line number
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set backspace=indent,eol,start " enable delete on insert mode
set signcolumn=number " merge signcolumn and number column into one
set hidden " TextEdit might fail if hidden is not set.
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set cmdheight=2 " Give more space for displaying messages.
set updatetime=300
set shortmess+=c " Don't pass messages to |ins-completion-menu|.
set tagfunc=CocTagFunc
let mapleader = ","

:nnoremap <leader><space> :nohlsearch<CR>

" Copy to clipboard
:vnoremap <leader>y "*y 
:vnoremap <leader>Y "+y
:vnoremap <leader>p "*p
:vnoremap <leader>P "+p

" Edit my vimrc file
:nnoremap <leader>ev :vsplit $MYVIMRC<CR> 
" Source my vimrc file
:nnoremap <leader>sv :source $MYVIMRC<CR>
" Edit vim plugins
:nnoremap <leader>ep :vsplit ~/.vim/plugins.vim<CR>
" Call PlugInstall
:nnoremap <leader>sp :source ~/.vim/plugins.vim<CR>:PlugInstall<CR>

:inoremap jk <esc>

:onoremap p i(
" NERDTree
map <C-b> :NERDTreeToggle<CR>
" Fuzzy Finder
nmap <C-p> :Files<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['govet', 'golint']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
nnoremap <leader>sc :SyntasticCheck<CR>

" ack
let g:ackprg = 'ag --vimgrep' " use ag instead of ack-grep
nnoremap <leader>a :Ack!<Space>

" git-gutter
set updatetime=100
highlight GitGutterAdd    guifg=#009900 guibg=#073642 ctermfg=2 ctermbg=0
highlight GitGutterChange guifg=#bbbb00 guibg=#073642 ctermfg=3 ctermbg=0
highlight GitGutterDelete guifg=#ff2222 guibg=#073642 ctermfg=1 ctermbg=0

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" vim-go
nnoremap <leader>gb :GoBuild<CR>
nnoremap <leader>gl :GoDecls<CR>
nnoremap <leader>gf :GoDeclsDir<CR>

let g:go_metalinter_enabled = ['vet', 'errcheck', 'golint']
let g:go_metalinter_autosave = 0 " Call gometalinter whenever you save a file 

let g:go_fmt_command = "goimports" " Format and rewrite your import declaration whenever you save your file
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
" molokai theme
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" coc.nvim
" " Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Vista
let g:vista_default_executive = 'coc'
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista_fzf_preview = ['right:50%']
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
" Show the nearest function in your statusline automatically
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
nmap <F8> :Vista<CR>

" copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" vim-rust
nnoremap <leader>rr :RustRun<CR>
let g:rustfmt_autosave = 1
let g:rust_cargo_use_clippy = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
