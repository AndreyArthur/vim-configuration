" Vim Plug
call plug#begin()
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline-tdefaulthemes'
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'phanviet/vim-monokai-pro'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Vim
syntax enable
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set softtabstop
set number
set relativenumber
set encoding=utf8
set colorcolumn=81

" Tabs Navigation
nnoremap <tab>t :tabnew<CR>
nnoremap <tab>n :tabnext<CR>
nnoremap <tab>p :tabprevious<CR>

" CoC
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-git'
  \ ]
nmap <F2> <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <c-space> coc#refresh()
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Theme
set termguicolors
colorscheme molokai
let g:molokai_original = 1

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-t> :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd VimEnter * NERDTree
let NERDTreeShowHidden=1

" Devicons
set guifont=DroidSansMono\ Nerd\ Font\ 11

" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
