" Set where vim-plug will install plugins
call plug#begin('~/.config/nvim/plugged')

" NERDTree for file browsing
Plug 'preservim/nerdtree'

" Mimic behavior of cmd+p in vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Color Themes
Plug 'morhetz/gruvbox'

" Status Bar
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'


Plug 'honza/vim-snippets'

Plug 'tpope/vim-commentary'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}


call plug#end()

syntax on
set number
" set relativenumber
set tabstop=4 shiftwidth=4 expandtab
" set autoindent
set mouse=a
colorscheme gruvbox

" Key mapping for fzf file search using ripgrep
nnoremap <C-p> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore-vcs'

" Key Mapping for NerdTree
nnoremap <C-b> :NERDTreeToggle<CR>

" Basic Coc mappings
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>rn  <Plug>(coc-rename)
nmap <leader>f   <Plug>(coc-format)
nmap <leader>d   <Plug>(coc-definition)

" Use <TAB> and <Shift-TAB> to navigate the completion menu:
inoremap <expr> <TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Use <Enter> to confirm completion, `<C-g>u` means break undo chain at current position:
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Enable lightline
set laststatus=2

function! LightlineGitBranch()
    return gitbranch#name()
endfunction

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'gitbranch' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'LightlineGitBranch'
    \ }
\ }



