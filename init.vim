" ===
" === Basic config
" ===
syntax on
set nu
set cursorline
set scrolloff=5
set mouse=a
set termguicolors
set guifont="FiraCode Nerd Font Mono"
set updatetime=1000
set list lcs=tab:\|\ 
set undofile
set smartindent
set showtabline=2
autocmd VimLeave * set gcr=a:ver5
autocmd InsertEnter * set gcr=i:ver5

" ===
" === Key map
" ===
" Set map leader
let mapleader=' '
nmap <silent><LEADER>w :w<CR>
nmap <silent><LEADER>q :q<CR>
nmap R :so %<CR>

" === Move
nmap <expr>= col(".")==1?"$":"0"
nmap J 5j
nmap K 5k

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
nmap <silent> ]q :cnext<CR>
nmap <silent> [q :cprevious<CR>
nmap <silent> +q :copen<CR>
nmap <silent> -q :cclose<CR>

" === Explorer
nmap <silent> ^e :CocCommand explorer<CR>

" === fzf
nmap <silent> +ff :Files<CR>
nmap <silent> +fg :GFiles<CR>
nmap <silent> +fr :Rg<CR>
nmap <silent> <c-p> :Files<CR>

" === Terminal mode map
tmap <esc> <c-\><c-n>

" ===
" === Plugins before config.
" ===

" === Gruvbox
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_undercurl = 1
let g:gruvbox_contrast_dark = 'soft'

" ===
" === Plugs
" ===
call plug#begin('~/.config/nvim/packs')
	" ===  Completion
	" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'honza/vim-snippets'
	Plug 'SirVer/ultisnips'

	" === Syntax
	Plug 'styled-components/vim-styled-components'
	Plug 'Yggdroot/indentLine'
	Plug 'alvan/vim-closetag'
	Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'AndrewRadev/switch.vim'
	Plug 'preservim/tagbar'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'tpope/vim-surround'
	Plug 'dense-analysis/ale'

	" === Tools
	Plug 'itchyny/lightline.vim'
	Plug 'mengelbrecht/lightline-bufferline'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'bling/vim-bufferline'
	Plug 'godlygeek/tabular'
	Plug 'gcmt/wildfire.vim'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'ryanoasis/vim-devicons'
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}
	Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
	Plug 'justinmk/vim-sneak'
	Plug 'mhinz/vim-startify'
	Plug 'tpope/vim-dispatch'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-commentary'
	Plug 'mbbill/undotree'

	" === Themes
	Plug 'ayu-theme/ayu-vim'
	Plug 'tomasiser/vim-code-dark'
	Plug 'morhetz/gruvbox'
	Plug 'connorholyday/vim-snazzy'
	Plug 'w0ng/vim-hybrid'
	Plug 'junegunn/seoul256.vim'
	Plug 'joshdick/onedark.vim'
	Plug 'ajmwagar/vim-deus'
	Plug 'rakr/vim-one'
	Plug 'bluz71/vim-moonfly-colors'
	Plug 'glepnir/oceanic-material'
call plug#end()

color deus

" ===
" === Plug after config
" ===

" === Coc
syntax sync minlines=1000

" let g:coc_global_extensions = [
" 	\ 'coc-vimlsp',
" 	\ 'coc-tsserver',
" 	\ 'coc-highlight',
" 	\]

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
" 			\ pumvisible() ? "\<C-n>" :
" 			\ <SID>check_back_space() ? "\<TAB>" :
" 			\ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
" 	let col = col('.') - 1
" 	return !col || getline('.')[col - 1]	=~# '\s'
" endfunction
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
" 															\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" nmap <F2> <Plug>(coc-rename)
" nmap <silent> gr <Plug>(coc-references)
" imap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" imap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

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

" ===
" === UltiSnips
" ===
let g:UltiSnipsExpandTrigger = '<C-y>'
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" ===
" === vim-closetag
" ===
let g:closetag_filetypes = 'html,xhtml,jsx,tsx'

" ===
" === nvim-treesitter
" ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		custom_captures = {
		},
	},
	incremental_selection = {
		enable = true,
		disable = { "cpp", "lua" },
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		}
	},
	refactor = {
		highlight_definitions = {
			enable = true
		},
		highlight_current_scope = {
			enable = true
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr"					-- mapping to rename reference under cursor
			}
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",			-- mapping to go to definition of symbol under cursor
				list_definitions = "gnD"			-- mapping to list all definitions in current file
			}
		}
	},
	textobjects = { -- syntax-aware textobjects
	enable = true,
	disable = {},
	keymaps = {
			["iL"] = { -- you can define your own textobjects directly here
				python = "(function_definition) @function",
				cpp = "(function_definition) @function",
				c = "(function_definition) @function",
				java = "(method_declaration) @function"
			},
			-- or you use the queries from supported languages with textobjects.scm
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["aC"] = "@class.outer",
			["iC"] = "@class.inner",
			["ac"] = "@conditional.outer",
			["ic"] = "@conditional.inner",
			["ae"] = "@block.outer",
			["ie"] = "@block.inner",
			["al"] = "@loop.outer",
			["il"] = "@loop.inner",
			["is"] = "@statement.inner",
			["as"] = "@statement.outer",
			["ad"] = "@comment.outer",
			["am"] = "@call.outer",
			["im"] = "@call.inner"
		}
	},
	ensure_installed = { 'c', 'html', 'typescript', 'javascript', 'css', 'cpp', 'go' },
}
EOF

" ===
" === tagbar.vim
" ===
nmap +tt :TagbarOpen<CR>
nmap -tt :TagbarClose<CR>
nmap ^tt :TagbarToggle<CR>

" ===
" === indentLine
" ===
let g:indentLine_char = '|'
hi NonText ctermfg=gray guifg=#504945

" ===
" === markdown instant
" ===
let g:instant_markdown_mathjax = 1
let g:instant_markdown_autostart = 1

" ===
" === lightline.vim
" ===
let g:lightline = {
	\ 'mode_map': {
		\ 'n': 'N',
		\ 'i': 'I',
		\ 'v': 'V',
		\ 'V': 'VL',
		\ '\<C-v>': 'VB',
		\ 'c': 'C',
		\ },
	\ 'colorscheme': 'deus',
	\'active': {
	\'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
	\},
	\'tabline': {
	\'left': [ ['buffers'] ],
	\'right': [ ['close'] ]
	\},
	\'component_expand': {
	\'buffers': 'lightline#bufferline#buffers'
	\},
	\'component_type': {
	\'buffers': 'tabsel'
	\}
\ }
let g:lightline#bufferline#enable_devicons = 1

" ===
" === undotree.vim
" ===
nmap <LEADER>u :UndotreeToggle<CR>
nmap <C-f> :UndotreeFocus<CR>
nmap <C-f> :UndotreeOpen<CR>

" ===
" === commentary.vim
" ===
nmap <C-c> gcc
imap <C-c> <Esc>gccA

" ===
" === asyncomplete.vim
" ===
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"
