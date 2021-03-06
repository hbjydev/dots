"  _   ___  __
" | |_| \ \/ /
" |  _  |\  /  hbjydev's vimrc sets
" |_| |_|/_/
"

set exrc
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set number
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undo
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set autoread

" more space to display messages
set cmdheight=2

" shorter updatetime to reduce delays
set updatetime=50

" don't pass messages to |ins-completion-menu|
set shortmess+=c

" add a line at 80 columns
set colorcolumn=80

" use gruvbox
colorscheme gruvbox
highlight Normal guibg=none

let g:completion_enable_snippet = 'vim-vsnip'
let g:rustfmt_autosave = 1

let g:lightline = {}
let g:lightline.colorscheme='gruvbox'
let g:lightline.active = {}
let g:lightline.active.left = [ [ 'mode' ], [], [ 'cocstatus' ] ]
let g:lightline.active.right = [ [ 'readonly', 'filename' ],
                               \ [ 'lineinfo' ],
                               \ [ 'gitbranch' ] ]
let g:lightline.component_function = {}
let g:lightline.component_function.gitbranch = 'FugitiveHead'

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=10
endif

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[38;2;%lu;%lu;%lum"
endif
