call plug#begin()
 
  Plug 'zivyangll/git-blame.vim'
  
  Plug 'bling/vim-airline'
  
  Plug 'preservim/nerdtree'

  Plug 'davidhalter/jedi-vim'

  Plug 'mhartington/oceanic-next'

  Plug 'Vimjas/vim-python-pep8-indent' 

  Plug 'majutsushi/tagbar'

  Plug 'pechorin/any-jump.vim'

  Plug 'sainnhe/sonokai'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

  Plug 'junegunn/fzf.vim'

call plug#end()

" map in your vimrc to avoid conflicts with other plugins
nnoremap <leader>b :<C-u>call gitblame#echo()<CR>
" map <leader>b :call gitblame#echo()

au BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set autoindent      |" copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set foldmethod=indent

nnoremap <space> za

let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" Theme
 syntax enable
" for vim 7
 set t_Co=256

" for vim 8
 if (has("termguicolors"))
  set termguicolors
 endif

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai
let g:airline_theme='sonokai'
nmap <silent> gd <Plug>(coc-definition)
map <F3> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

" Add ag search support
let g:ackprg = 'ag --nogroup --nocolor --column'

