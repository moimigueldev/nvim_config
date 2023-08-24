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

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'honza/vim-snippets'

Plug 'tpope/vim-commentary'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'sindrets/diffview.nvim'
Plug 'ryanoasis/vim-devicons'


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


" Enable the plugin
let g:airline#extensions#tabline#enabled = 1

" Show just the buffer number and the filename
let g:airline#extensions#tabline#fnamemod = ':t'

function! ToggleDiffView()
    if exists('t:DiffviewIsOpen') && t:DiffviewIsOpen
        silent! DiffviewClose
        let t:DiffviewIsOpen=0
    else
        silent! DiffviewOpen
        let t:DiffviewIsOpen=1
    endif
endfunction


nnoremap <leader>dt :call ToggleDiffView()<CR>
let g:diffview_use_icons = v:false

nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>qq :q!<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>n :NERDTreeFind<CR>

