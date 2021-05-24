" Vim Plug

  call plug#begin()
  
  " Gruvbox Colorscheme
    Plug 'morhetz/gruvbox'

  " JSX support
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'ianks/vim-tsx'

  " Airline
    Plug 'vim-airline/vim-airline-themes'

  " Airline themes
    Plug 'vim-airline/vim-airline'

  " Conquer of Completion
    Plug 'neoclide/coc.nvim'

  " Devicons support
    Plug 'ryanoasis/vim-devicons'

  call plug#end()

" Vim

  " Highlighting
    syntax enable

  " Indentation
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
    set expandtab
    set autoindent

  " Line numbers
    set number
    set relativenumber

  " Encoding
    set encoding=utf8

  " Wrap
     set nowrap

  " Column lines
    exec 'set colorcolumn='.join(range(81, 101, 20), ',')

  " Custom commands
    com! -nargs=1 SearchLiteral :let @/='\V'.escape(<q-args>, '\\')| normal! n

  " Buffer especific settings
    autocmd BufRead,BufNewFile *.json,.babelrc set filetype=json
    autocmd FileType markdown set wrap

  " Representing especific chars with other chars
    set listchars=tab:>~
    set list

  " Snippets
  
    " jest 
      nnoremap ,jest :-1read $HOME/.config/nvim/snippets/jest.ts<CR>f'a

  " Bindings
  
    " Search for all occurrences of the word that cursor is above
      nnoremap <silent> <c-s>w yiw:SearchLiteral <c-r>"<cr>

    " Search for all occurrences of the current visual selection
      vnoremap <silent> <c-s>v y:SearchLiteral <c-r>"<cr>

    " Disable search selection highlighting
      nnoremap <silent> <c-s>h :noh<cr>

    " Return to normal mode in terminal
      tnoremap <esc> <c-\><c-n>

    " Copy to clipboard
      vnoremap <silent> <c-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>

" CoC

  " Coc extensions
    let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-emmet',
      \ 'coc-pairs',
      \ 'coc-json',
      \ 'coc-phpls',
      \ 'coc-explorer',
      \ 'coc-css'
      \ ]

  " Rename an identifier
    nmap <F2> <Plug>(coc-rename)

  " Go to definition
    nmap <silent> gd <Plug>(coc-definition)

  " Identifier documentation
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

  " Refresh completion suggestions
    inoremap <silent><expr> <c-space> coc#refresh()

  " Remap <tab> to be the completion key instead of <cr>
    inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
    inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

  " Toggle coc-explorer window
    nnoremap <silent> <c-n> :CocCommand explorer --toggle<cr>

" Theme

  " Enabling termguicolors (a lot of colorschemes will not work without this option)
    set termguicolors

  " Setting gruvbox dark
    set background=dark

  " Setting colorscheme
    colorscheme gruvbox

" Devicons

  " Setting NerdFont
  set guifont=DroidSansMono\ Nerd\ Font\ 11

" Airline

  " Setting powerline symbols to airline
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

  " Lowercasing arline shown mode names
    let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'command',
      \ 'i'      : 'insert',
      \ 'ic'     : 'insert',
      \ 'ix'     : 'insert',
      \ 'n'      : 'normal',
      \ 'multi'  : 'multi',
      \ 'ni'     : 'normal',
      \ 'no'     : 'normal',
      \ 'R'      : 'replace',
      \ 'Rv'     : 'replace visual',
      \ 's'      : 'select',
      \ 'S'      : 'select',
      \ ''     : 'select',
      \ 't'      : 'terminal',
      \ 'v'      : 'visual',
      \ 'V'      : 'visual line',
      \ ''     : 'visual block' }
