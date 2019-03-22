call plug#begin('~/vim/plugged')

Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/goyo.vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim'
Plug 'majutsushi/tagbar'

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

"let g:deoplete#enable_at_startup = 1

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
set conceallevel=1
let g:tex_conceal='abdmg'

nmap <F10> <Esc>[sz=
