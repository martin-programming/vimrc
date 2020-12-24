syntax on
set nocompatible
set encoding=UTF-8
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile
set smartindent
set ruler
set autoread
set rnu
set spell
set updatetime=100
" when you start searching text with /, search is performed at every new character insertion
set incsearch
set nopaste
set autoindent
set fileformats=unix,dos
" docblock comments are continued when a newline is inserted
set comments=sr:/*,mb:*,ex:*/
filetype on
filetype plugin on

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Vim status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntastic
Plug 'scrooloose/syntastic'

" Jinja
Plug 'lepture/vim-jinja'

" Themes
Plug 'flazz/vim-colorschemes'

Plug 'gosukiwi/vim-atom-dark'

Plug 'rakr/vim-one'

Plug 'kamykn/dark-theme.vim'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'joshdick/onedark.vim'

Plug 'drewtempelmeyer/palenight.vim'

" Nerd tree
Plug 'preservim/nerdtree'

Plug 'gko/vim-coloresque'

Plug 'glench/vim-jinja2-syntax'

Plug 'tpope/vim-surround'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'SirVer/ultisnips'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'wilywampa/vim-commentary'

Plug 'yggdroot/indentline'

Plug 'mattn/emmet-vim'

Plug 'pangloss/vim-javascript'

Plug 'StanAngeloff/php.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" On-demand loading
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'jremmen/vim-ripgrep'

Plug 'airblade/vim-gitgutter'

Plug 'bronson/vim-trailing-whitespace'

Plug 'tpope/vim-fugitive'

Plug 'ryanoasis/vim-devicons'

Plug 'preservim/tagbar'

Plug '907th/vim-auto-save'

Plug 'jiangmiao/auto-pairs'

Plug 'nelsyeung/twig.vim'

" Initialize plugin system
call plug#end()

colorscheme one
set background=dark

" let g:indentLine_setColors = 0
let g:airline_theme='dark'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:one_allow_italics = 1
let g:airline_powerline_fonts = 1
let g:lightline = { 'colorscheme': 'vimicks' }
" Enable true colors
if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
	set termguicolors
endif

let mapleader = " "
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>
nnoremap <silent> <Leader>r :FixWhitespace<CR>

" Git shortcuts
nnoremap <silent> <Leader><Space> :GFiles<CR>
nnoremap <silent> <Leader>f :Gstatus<CR>
nnoremap <silent> <Leader>c  :Commits<CR>
nnoremap <silent> <Leader>bc :BCommits<CR>
nnoremap <silent> <Leader>ag :Ag<CR>
nnoremap <silent> <Leader>gd :Gdiffsplit<CR>
nnoremap <silent> <Leader>gw :Git blame<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
:imap ii <Esc>

" Gitgutter
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
"highlight SignColumn guibg=#000000 ctermbg=Black
let g:gitgutter_sign_removed = '^^'
let g:gitgutter_enabled = 1
"enable AutoSave on Vim startup
let g:auto_save = 1
