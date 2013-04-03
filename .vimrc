call pathogen#infect()

syntax enable

filetype on
filetype indent plugin on

set autoindent
set backspace=indent,eol,start
set colorcolumn=80
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
set wildignore+=*.o,.git,app/assets/images,tmp
set wildmenu
set wildmode=longest:full,full
set whichwrap=b,h,l,s,<,>,[,],~

" some limits for git commits
autocmd FileType gitcommit setlocal textwidth=72 fo+=t

" jj gets back to command mode
map! jj <Esc>

" Tab navigation
map <C-h> gT<CR>
map <C-j> gT<CR>
map <C-k> gt<CR>
map <C-l> gt<CR>

" TextMate-style fold levels
map <leader>0 :set foldlevel=99<CR>
map <leader>1 :set foldlevel=1<CR>
map <leader>2 :set foldlevel=2<CR>
map <leader>3 :set foldlevel=3<CR>
map <leader>4 :set foldlevel=4<CR>
map <leader>5 :set foldlevel=5<CR>

" Don't start out with anything folded by default
set foldlevel=99

" Newlines without insert mode
map <Leader>e O<Esc>
map <Leader>d o<esc>

" Quick and dirty save/close
map <C-s> :w<CR>
map <leader>w :q<CR>

" Command-T setup
map <C-t> :CommandT<CR>
map <leader>t :CommandT<CR>
map <leader>y :CommandTAcceptSelectionTabMap<CR>
nnoremap <leader>f :CommandTFlush<CR>
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
let g:CommandTMaxFiles=50000
let g:CommandTMaxHeight=10
let g:CommandTScanDotDirectories = 1
let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']

" Move the usual vim pane to C-e, since I give C-w to tmux
map! <C-e> <C-w>

" Hat tip to Aiden. Converts Ruby 1.8.7 hashes to 1.9 syntax file-wide
nmap <leader>rh :%s/\v:(\w+) \=\>/\1:/g<CR>

" Shortcuts for common whitespace aligning
map <leader>= :Tabularize/=<CR>
map <leader>; :Tabularize/:<CR>
map <leader>: :Tabularize/:<CR>

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

" Let syntastic know about my jsl.conf
let g:syntastic_javascript_jsl_conf = "-conf ~/.jsl.conf"

colorscheme twilight256
:hi ColorColumn ctermbg=234
:hi CursorLine cterm=NONE ctermbg=234
:hi Folded ctermbg=234
:hi IncSearch cterm=none ctermbg=none ctermfg=yellow
:hi LineNr cterm=none ctermfg=229
:hi Search cterm=none ctermbg=none ctermfg=yellow
:hi TabLine cterm=underline ctermbg=none
:hi TabLineFill cterm=underline ctermbg=none
:hi TabLineSel cterm=underline ctermfg=yellow
:hi Todo ctermbg=none
:hi htmlLink cterm=none
:hi markdownH1 ctermfg=229
:hi markdownItalic ctermbg=none

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Leave this at the end to avoid being overridden
highlight ExtraWhitespace ctermbg=red guibg=red
