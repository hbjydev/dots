"  _   ___  __
" | |_| \ \/ /
" |  _  |\  /  hbjydev's main vimrc file
" |_| |_|/_/
"

"
" plugins
"

call plug#begin(stdpath('data') . '/plugged')

" LSP & Completion plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'aca/completion-tabnine', { 'do': './install.sh' }
Plug 'nvim-lua/lsp_extensions.nvim'

" The best searching stuff around
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Snippet support
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Little to-do app
Plug 'vuciv/vim-bujo'

" Better undo support
Plug 'mbbill/undotree'

" Read man pages in Vim
Plug 'vim-utils/vim-man'

" Git Integration
Plug 'tpope/vim-fugitive'

" Language Specific
Plug 'tweekmonster/gofmt.vim'
Plug 'rust-lang/rust.vim'

" Browser integration
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Theming & appearance
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'nolo18/base16lightline'

" Some good editing stuffs
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

let mapleader = " "

source ~/.config/nvim/sets.vim
source ~/.config/nvim/augroups.vim
source ~/.config/nvim/lsp.vim
source ~/.config/nvim/telescope.vim
source ~/.config/nvim/limelight.vim

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

" netrw
nnoremap <leader>pv :Sex!<cr>
