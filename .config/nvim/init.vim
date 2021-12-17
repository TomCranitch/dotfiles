call plug#begin('~/vim/plugged')

Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'junegunn/goyo.vim'
" Plug 'dylanaraps/wal.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'

call plug#end()

set number
set spell
set clipboard+=unnamedplus
set hidden
set updatetime=300

set autoindent
set tabstop=4
set shiftwidth=4

filetype on
filetype plugin on

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'tex'

nmap <F10> <Esc>[sz=

set noshowmode

" Coc
set cmdheight=2
set updatetime=300
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap rn <Plug>(coc-rename)

let g:pandoc#after#modules#enabled = ["ultisnips"]

" Hopefully this fixes terminal colours
let &t_ut=''

let g:vim_markdown_folding_disabled = 1
