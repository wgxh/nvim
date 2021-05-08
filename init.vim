" ===
" === Basic config
" ===
syntax on
set nu
set rnu
set cursorline
set termguicolors
set scrolloff=5
set mouse=a

" ===
" === Key map
" ===
" Set map leader
let mapleader=' '

nmap <LEADER>w :w<CR>
nmap <LEADER>q :q<CR>
nmap Q :x<CR>
nmap S :w<CR>
nmap R :so %<CR>
nmap L $
nmap H ^
nmap ; :
nmap <C-o> :Files<CR>
nmap <C-l> :bn<CR>
nmap <C-h> :bp<CR>

" ===
" === Plugs
" ===
call plug#begin('~/.config/nvim/packs')
  " ===  Completion
  Plug 'neoclide/coc.nvim'

  " === Syntax
  Plug 'sheerun/vim-polyglot'
  Plug 'styled-components/vim-styled-components'

  " === Tools
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'bling/vim-bufferline'

  " === Themes
  Plug 'https://gitclone.com/github.com/ajmwagar/vim-deus'
  Plug 'ayu-theme/ayu-vim'

  " === Other
  Plug 'editorconfig/editorconfig-vim'
  Plug 'mhinz/vim-startify'
call plug#end()

let ayucolor="dark"
colors deus

" ===
" === Plug config
" ===

" === Coc
let g:coc_global_extensions = [
  \ 'coc-vimlsp',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-highlight',
  \ 'coc-eslint']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nmap <F2> <Plug>(coc-rename)

" === airline
let g:airline_powerline_fonts = 1

