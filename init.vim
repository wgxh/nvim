" ===
" === Basic config
" ===
syntax on
set nu
set rnu
set cursorline
set scrolloff=5
set mouse=a
set termguicolors
set guifont="FiraCode Nerd Font Mono"
set nocompatible

" ===
" === Key map
" ===
" Set map leader
let mapleader=' '

nmap <silent><LEADER>w :w<CR>
nmap <silent><LEADER>q :q<CR>
nmap Q :x<CR>
nmap S :w<CR>
nmap R :so %<CR>
nmap L $
nmap H ^
nmap ; :

" === Buffer
nmap <silent> ]b :bn<CR>
nmap <silent> [b :bp<CR>
nmap <silent> +b :bnew<CR>
nmap <silent> -b :bd<CR>

" === Tab
nmap <silent> ]t :tabn<CR>
nmap <silent> [t :tabp<CR>
nmap <silent> +t :tabnew<CR>
nmap <silent> -t :tabc<CR>

" === Quickfix list
nmap <silent> ]c :cnext<CR>
nmap <silent> [c :cprevious<CR>
nmap <silent> +c :copen<CR>
nmap <silent> -c :cclose<CR>

" === Explorer
nmap <silent> ^e :CocCommand explorer<CR>

" === fzf
nmap <silent> +ff :Files<CR>
nmap <silent> +fg :GFiles<CR>
nmap <silent> +fr :Rg<CR>

" === Terminal mode map
tmap <esc> <c-\><c-n>

" ===
" === Plugs
" ===
call plug#begin('~/.config/nvim/packs')
  " ===  Completion
  Plug 'neoclide/coc.nvim'
  Plug 'dense-analysis/ale'

  " === Syntax
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'styled-components/vim-styled-components'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'maxmellon/vim-jsx-pretty'

  " === Tools
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'bling/vim-bufferline'
  Plug 'mg979/vim-xtabline'
  Plug 'godlygeek/tabular'
  Plug 'kevinhwang91/rnvimr'
  Plug 'tpope/vim-surround'
  Plug 'gcmt/wildfire.vim'
  Plug 'christoomey/vim-tmux-navigator'

  " === Themes
  Plug 'ajmwagar/vim-deus'
  Plug 'ayu-theme/ayu-vim'
  Plug 'tomasiser/vim-code-dark'
  Plug 'morhetz/gruvbox'
  Plug 'connorholyday/vim-snazzy'
  Plug 'w0ng/vim-hybrid'

  " === Other
  Plug 'editorconfig/editorconfig-vim'
  Plug 'mhinz/vim-startify'
call plug#end()

let ayucolor="mirage"
colors gruvbox

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

" === Xtabline
let g:xtabline_settings = {}
let g:xtabline_settings.tabline_modes = ['buffers', 'tabs']

" === ALE
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_fix_on_save = 1
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}

" === vim jsx pretty
let g:vim_jsx_pretty_colorful_config = 1

" === fzf & fzf.vim
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
