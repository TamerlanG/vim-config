set nocompatible

" --- General Settings --- "
set backspace=indent,eol,start
set ruler
set number relativenumber
set showcmd
set incsearch
set hlsearch
set mouse=a
set tabstop=4
set encoding=UTF-8
set vb 
set spelllang=en_us
set clipboard=unnamed
set noscrollbind
set wildmenu
set autochdir

" No more Arrow Keys, deal with it
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

filetype on
filetype indent on
filetype plugin on

let mapleader = " "

syntax on

" --- Visual Settings --- "
set background=dark

colorscheme xcodedarkhc

set laststatus=2

let g:airline_detect_paste=1
let g:airline#extension#tabline#enabled=1
let g:airline_powerline_fonts=1

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" --- Plugins ---"
call plug#begin()
  " --- Visual Plugins --- "
  Plug 'altercation/vim-colors-solarized'
  Plug 'tomasr/molokai'
  Plug 'arzg/vim-colors-xcode'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'  
  Plug 'mhinz/vim-startify'

  " --- Syntax --- "
  Plug 'scrooloose/syntastic'

  " ----- Working with Git ----------------------------------------------
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " ----- Other text editing features -----------------------------------
  Plug 'Raimondi/delimitMate'
  Plug 'preservim/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-easytags'
  Plug 'majutsushi/tagbar'
  Plug 'kien/ctrlp.vim'
  "Plug 'ycm-core/YouCompleteMe'"
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " --- Golang --- "
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


call plug#end()
			
" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>e :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
