"  _   ___  __
" | |_| \ \/ /
" |  _  |\  /  hbjydev's main vimrc file
" |_| |_|/_/
"

"
" plugins
"

call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'aca/completion-tabnine', { 'do': './install.sh' }
Plug 'nvim-lua/lsp_extensions.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'vuciv/vim-bujo'

Plug 'mbbill/undotree'
Plug 'vim-utils/vim-man'

Plug 'tpope/vim-fugitive'

Plug 'tweekmonster/gofmt.vim'
Plug 'rust-lang/rust.vim'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'chriskempson/base16-vim'

Plug 'itchyny/lightline.vim'
Plug 'nolo18/base16lightline'

call plug#end()

let mapleader = " "

source ~/.config/nvim/sets.vim
source ~/.config/nvim/augroups.vim
source ~/.config/nvim/lsp.vim
source ~/.config/nvim/telescope.vim

"
" keybinds
"

" use C-c as if it were ESC
inoremap <C-c> <esc>

" paste without emptying black hole register
xnoremap p "_dP

" copying to the system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" searcher
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>s <cmd>Telescope live_grep<cr>

" pane navigation with space + direction
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" quick shortcut to quit
nnoremap <leader>q :q<CR>

" C-Space to trigger completion
imap <silent> <c-space> <Plug>(completion_trigger)

" jump to first non-whitespace character, then to first character in the line
function! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') == first_nonblank
    return '0'  " if at first nonblank, go to start line
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction
noremap <expr> <silent> <Home> SmartHome()
imap <silent> <Home> <C-O><Home>

" open todo list
nnoremap <leader>T :Todo g<cr>
nnoremap <leader>t :Todo<cr>
