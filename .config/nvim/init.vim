call plug#begin('~/vim/plugged')

Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'junegunn/goyo.vim'
Plug 'w0rp/ale'
"Plug 'Shougo/deoplete.nvim'
Plug 'majutsushi/tagbar'
Plug 'skywind3000/asyncrun.vim'
Plug 'dylanaraps/wal.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'liuchengxu/vista.vim'

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

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDir = '~/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

"let g:deoplete#enable_at_startup = 1
"autocmd FileType tex let g:deoplete#enable_at_startup = 0

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

" autocmd FileType c map <F8> :w <CR> :AsyncRun gcc % -o %< <CR> 
" autocmd FileType c map <F9> :AsyncRun "./%<" <CR>

let g:asyncrun_open = 6

" colorscheme wal

" Disable the candidates in Comment/String syntaxes.
"call deoplete#custom#source('_',
"            \ 'disabled_syntaxes', ['Comment', 'String'])



let g:airline_powerline_fonts = 1
set noshowmode

let g_airline_detect_spell=0

nmap <F8> :TagbarToggle<CR>

" Coc
set cmdheight=2
set updatetime=300
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap rn <Plug>(coc-rename)
