call plug#begin('~/vim/plugged')

Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/goyo.vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim'
Plug 'majutsushi/tagbar'
Plug 'skywind3000/asyncrun.vim'

call plug#end()

set number
set spell
set clipboard+=unnamedplus

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDir = '~/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

let g:deoplete#enable_at_startup = 1
autocmd FileType tex let g:deoplete#enable_at_startup = 0

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
"set conceallevel=1
"let g:tex_conceal='abdmg'

nmap <F10> <Esc>[sz=
" autocmd FileType c map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>

autocmd FileType c map <F8> :w <CR> :AsyncRun gcc % -o %< <CR> 
autocmd FileType c map <F9> :AsyncRun "./%<" <CR>

let g:asyncrun_open = 6
