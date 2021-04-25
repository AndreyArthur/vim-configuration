" Vim Plug
call plug#begin()
Plug 'thanthese/Tortoise-Typing'
Plug 'ayu-theme/ayu-vim'
Plug 'ianks/vim-tsx'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
set nowrap
nnoremap <space> i<space><esc>
nnoremap <CR> i<CR><esc>
tnoremap <esc> <c-\><c-n>
autocmd BufRead,BufNewFile *.json,.babelrc set filetype=json
  " Tabs navigation mapping
  nnoremap <c-t>d :tabclose<CR>
  nnoremap <c-t>n :tabnew<CR>
  nnoremap <c-t>l :tabnext<CR>
  nnoremap <c-t>h :tabprevious<CR>
  nnoremap <c-t>t :tabnew<CR>:term<CR>

" CoC
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-git',
  \ 'coc-emmet'
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

" Emmet Vim
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

" Theme
set termguicolors
set t_Co=256
let g:ayucolor="dark"
colorscheme ayu

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" Devicons
set guifont=DroidSansMono\ Nerd\ Font\ 11

" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
