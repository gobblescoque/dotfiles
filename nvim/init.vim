" List of all plugins for vim-plug
call plug#begin('~/.vim/plugged')
Plug 'szymonmaszke/vimpyter'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'tmhedberg/SimpylFold'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'rudrab/vimf90'

" Themes
Plug 'morhetz/gruvbox'
Plug 'franbach/miramare'
Plug 'rafi/awesome-vim-colorschemes'
call plug#end()

" Set theme
set termguicolors
"let g:miramare_enable_italic = 1
"let g:miramare_disable_italic_comment = 1
colorscheme deus
" let g:airline_theme = 'anderson'


" set background=dark
" set background=light

" Opens NerdTree on start if no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Map control+n to open NerdTree
map <s-n> :NERDTreeToggle<CR>

" Start deoplete on startup
let g:deoplete#enable_at_startup = 1

" Enable code checker on startup
let g:neomake_python_enabled_makers = ['pylint']

" Enables line numbering and line width
set nu 
set textwidth=79
set colorcolumn=79
"highlight ColorColumn ctermbg=green guibg=orange
" 
" fix fortran highlighting issues
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1

" Settings for tabs
set expandtab
set shiftwidth=2

" Sets line length in python files
autocmd FileType python setlocal colorcolumn=79

" Fixes bracket matching for some themes. Disable if needed.
hi! MatchParen cterm=NONE,bold gui=NONE,bold  guibg=#eee8d5 guifg=NONE

" Vimtex settings
let g:tex_flavor = 'latex' 
let g:vimtex_indent_enabled = 1
let g:vimtex_indent_on_ampersands = 0

" Runs python code
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


" Hotkeys for Vimpyter
autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
