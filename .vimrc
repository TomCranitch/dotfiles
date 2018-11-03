call plug#begin('~/vim/plugged')

Plug 'lervag/vimtex'
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'
Plug 'vimwiki/vimwiki'

call plug#end()

set number
set spell

" VimWiki Requirements
set nocompatible
filetype plugin on
syntax on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_poulate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

let g:ycm_key_list_select_completeion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['C-p>', '<Up>']

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

let g:vimwiki_list = [{'path': '~/Nextcloud/Wiki/', 'index': 'index', 'ext': '.md', 'syntax': 'markdown'}]

nmap <F10> <Esc>[sz=
