call plug#begin('~/vim/plugged')

Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'junegunn/goyo.vim'
" Plug 'w0rp/ale'
" Plug 'majutsushi/tagbar'
Plug 'skywind3000/asyncrun.vim'
" Plug 'dylanaraps/wal.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Plug 'liuchengxu/vista.vim'
Plug 'godlygeek/tabular'
Plug 'tomcranitch/vim-markdown'
" Plug 'dhruvasagar/vim-table-mode'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'tpope/vim-dadbod'
Plug 'jparise/vim-graphql'

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

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDir = '~/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

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

"set conceallevel=1
"let g:tex_conceal='abdmg'

nmap <F10> <Esc>[sz=

let g:asyncrun_open = 6

set noshowmode

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

let g:pandoc#after#modules#enabled = ["ultisnips"]

let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1


" TODO: not sure this is working
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'

" Hopefully this fixes terminal colours
let &t_ut=''
