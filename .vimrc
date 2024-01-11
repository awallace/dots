execute pathogen#infect()
syntax on
filetype indent plugin on

set autoindent
set backspace=indent,eol,start
" set colorcolumn=80
set dir=~/.vim/tmp
set encoding=utf-8
set expandtab
set foldmethod=indent
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set nocompatible
set nolist
set nojoinspaces
set noshowmatch
set number
set scrolloff=10
set shiftwidth=2
set shortmess+=A
set showcmd
set smartcase
set smarttab
set tabstop=2
set textwidth=80
set virtualedit=block
set wildignore+=*.o,.git,app/assets/images,tmp,node_modules,dist,tmp/cache/assets
set wildmenu
set wildmode=longest:full,full
set whichwrap=b,h,l,s,<,>,[,],~

set sessionoptions-=options

" some limits for git commits
autocmd FileType gitcommit setlocal textwidth=72 fo+=t

" jj gets back to command mode
map! jj <Esc>

" Annoying window
map q: :q

" Tab navigation
map <C-h> gT<CR>
map <C-l> gt<CR>

map <C-E> <C-W>
map <C-j> <C-E>h
map <C-k> <C-E>l

" TextMate-style fold levels
map <leader>0 :set foldlevel=99<CR>
map <leader>1 :set foldlevel=1<CR>
map <leader>2 :set foldlevel=2<CR>

" Don't start out with anything folded by default
set foldlevel=99

" Quick and dirty save/close
map <C-s> :w<CR>
map <leader>w :q<CR>

colorscheme twilight256

let g:airline_theme='solarized'
let g:airline_theme_bg='dark'
let g:airline_section_y=''
let g:airline_section_z=''

" Command-T setup
map <leader>t :CommandTWatchman<CR>
map <leader>f :CommandTFlush<CR>
let g:CommandTAcceptSelectionMap = '<CR>'
let g:CommandTAcceptSelectionTabMap = '<C-t>'
let g:CommandTAcceptSelectionSplitMap = '<C-s>'
let g:CommandTAcceptSelectionVSplitMap = '<C-v>'
let g:CommandTMaxFiles=500000
let g:CommandTMaxHeight=20
let g:CommandTScanDotDirectories = 1
let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
let g:CommandTSelectNextMap = ['<C-j>']
let g:CommandTSelectPrevMap = ['<C-k>']

" Shortcuts for common whitespace aligning
map <leader>= :Tabularize/=<CR>

" Shortcuts for common quote/replacing
map <leader>' cs"'<CR>
map <leader>" cs'"<CR>

" This centers search results during inc search
:nnoremap * *zz
:nnoremap n nzz
:nnoremap N Nzz

" Always use /v for searching
vnoremap / /\v

nnoremap <leader>n :noh<CR>
nnoremap <silent> <leader>zz :let _last_search=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_last_search <Bar> :noh<CR>

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Leave this at the end to avoid being overridden
highlight ExtraWhitespace ctermbg=red guibg=red
set noeb vb t_vb=

" if !exists('##TextYankPost')
"   map y <Plug>(highlightedyank)
" endif
" let g:highlightedyank_highlight_duration = 150
" highlight HighlightedyankRegion cterm=reverse gui=reverse
" 
" let g:ale_fixers = {
" \  'javascript': ['eslint'],
" \}
" let g:ale_fix_on_save = 1
" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '⚠'
" let g:ale_sign_column_always = 1
" highlight ALEErrorSign ctermbg=black ctermfg=red
" highlight ALEWarningSign ctermbg=black ctermfg=yellow
" hi clear SignColumn
