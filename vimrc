" let there be light!
syntax on

" remove the .ext~ files, but not swapfiles
set nobackup
set writebackup
set noswapfile

" Set which shell to use
" Probably wont work on Windows
set shell=/bin/sh

" Color Scheme

" Theme: Solarized
syntax reset
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" Makes search act like search in modern browsers
set incsearch

" General
set number	    " Show line numbers
set linebreak	    " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set showmatch	    " Highlight matching brace
set visualbell	    " Use visual bell (no beeping)
 
" Search
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set incsearch	" Searches for strings incrementally
  
" Indentation
set autoindent	    " Auto-indent new lines
set expandtab	    " Use spaces instead of tabs
set shiftwidth=4    " Number of auto-indent spaces
set smarttab	    " Enable smart-tabs
set softtabstop=4   " Number of spaces per Tab
set cindent         " Closing braces

" Advanced
set ruler " Show row and column ruler information
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start " Backspace behaviour
filetype plugin indent on " helps with indentation and file recognition

" vim-airline
let g:airline_theme = 'base16_solarized'
let g:airline_powerline_fonts = 1 " use the font? https://github.com/powerline/fonts
let g:airline#extensions#hunks#enabled= 0  " show additions/removals in repo
let g:airline#extensions#branch#enabled= 1 " show the active git branch
let g:airline#extensions#tabline#enabled = 1 " show buffer tabs at top of screen
" let g:airline_left_sep = '»' " with powerline-fonts you don't need these
" lines
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'

" NERDTree
"autocmd vimenter * NERDTree " open on load
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " Show dotfiles by default

" vim-css3-syntax
augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END

" Indent BASH
let g:sh_indent_case_labels=1

