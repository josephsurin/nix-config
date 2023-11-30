set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
imap <C-l> <ESC>
vmap <C-l> <ESC>
inoremap jk <ESC>
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap ' `
nnoremap t `

set number

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:python_highlight_all = 1
syntax on

colorscheme gruvbox
let g:airline_theme='base16_gruvbox_dark_medium'
let g:gruvbox_contrast_dark = "hard"
hi Normal guibg=NONE ctermbg=NONE
hi Comment cterm=italic ctermfg=green
" set background=dark
set termguicolors

highlight clear LineNr

" vim multiple cursor keybinds
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" vim easymotion keybinds
let gLEasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)
map fj <Plug>(easymotion-j)
map fk <Plug>(easymotion-k)

" use python filetype for sage
autocmd BufRead,BufNewFile *.sage set filetype=python
augroup filetypedetect
  au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
augroup END

" Latex specification
let g:tex_flavor = 'latex'

au BufNewFile,BufRead *.tex
    \ set nocursorline |
    \ set nornu |
    \ set number |
    \ let g:loaded_matchparen=1 |

let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \}

let g:vimtex_compiler_latexmk = {
    \ 'build_dir': 'build',
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

let g:Tex_BibtexFlavor = 'biber'
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_MultipleCompileFormats='pdf,dvi,bibtex'

" markdown preview everywhere
let g:mkdp_command_for_global = 1

" coc.nvim STUFF ============
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
imap <expr> <C-l> coc#pum#visible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <C-j>
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#pum#visible() ? coc#pum#next(1):
    \ coc#refresh()
inoremap <silent><expr> <TAB>
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#pum#visible() ? coc#pum#next(1):
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

" " coc snippets ======
let g:coc_snippet_next = '<c-l>'
let g:coc_snippet_prev = '<c-h>'


command Lbc :r ~/.vim/snippets/lbc | :execute 'normal k' | :execute 'normal dd'
command Resultants :r ~/.vim/snippets/resultants | :execute 'normal k' | :execute 'normal dd'
command Pgcd :r ~/.vim/snippets/pgcd | :execute 'normal k' | :execute 'normal dd'
