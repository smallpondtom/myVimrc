""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tomoki Koike vimrc file


set encoding=UTF-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set exrc
set shell=/bin/bash

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible 			" be improved required
filetype off				" required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"===> Vundle Manager
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup'

"===> Git repos local machine
" Plugin 'file://home/gmarik/path/to/plugin'

"===> Code Formatting
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdcommenter'
Plugin 'ryanoasis/vim-devicons'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'mg979/vim-visual-multi'
Plugin 'chiel92/vim-autoformat'
Plugin 'tell-k/vim-autopep8'

"===> File Explorer
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

"===> Visuals and Colorscheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'frazrepo/vim-rainbow'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'

"===> Linting and Syntax Checker
Plugin 'scrooloose/syntastic'
" Plugin 'valloric/youcompleteme'  " install cmake and compile YCM
								 " cd ~/.vim/bundle/YouCompleteMe
								 " python3 install.py --all
Plugin 'neoclide/coc.nvim'

"===> Git Integration
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'git://git.wincent.com/command-t.git'

"===> HTML CSS Javascript
Plugin 'mattn/emmet-vim'

"===> Haskell
Plugin 'eagletmt/neco-ghc'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'alx741/vim-hindent'
Plugin 'jaspervdj/stylish-haskell'
Plugin 'nbouscal/vim-stylish-haskell'


"===> Rust
Plugin 'rust-lang/rust.vim'

" All Plugins must be added before the following lines
call vundle#end()			" required
filetype plugin indent on   " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configurations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"===> Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']
"let NERDTreeShowHidden = 1
"let g:NERDTreeWinPos="left"
let NERDTreeAutoDeleteBuffer = 1
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"===> NerdTreeGitPlugin
" let g:NERDTreeGitStatusIndicatorMapCustom = {
"                 \ 'Modified'  :'✹',
"                 \ 'Staged'    :'✚',
"                 \ 'Untracked' :'✭',
"                 \ 'Renamed'   :'➜',
"                 \ 'Unmerged'  :'═',
"                 \ 'Deleted'   :'✖',
"                 \ 'Dirty'     :'✗',
"                 \ 'Ignored'   :'☒',
"                 \ 'Clean'     :'✔︎',
"                 \ 'Unknown'   :'?',
"                 \ }
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0

"===> GitGutter
set signcolumn=yes

nmap ]h <Plug>(GitGutterNextHunk) "same as default
nmap [h <Plug>(GitGutterPrevHunk) "same as default

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_highlight_lines = 1

"===> Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_python_checkers=['flake8', 'pylint']
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint', 'make']
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_javascript_checkers = ['jshint', 'eslint']
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_ruby_checkers = ['rubocop']

"===> VimRainbow
" let g:rainbow_active = 1

" let g:rainbow_load_separately = [
"    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
"    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
"    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"===> Vim Airlilne
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts=1

"===> Nerd Commenter
"Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"===> Vim-Devicons
" Show folder icons
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif


"===> Tagbar configuration 
nmap <F8> :TagbarToggle<CR>
" Download exuberant-ctags => sudo apt-get install exuberant c-tags

"===> AutoFormat configuration
noremap <F3> :Autoformat<CR>
let g:formatter_yapf_style = 'pep8'

"===> NerdTree Syntax Highlight
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

"===> FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 

"===> YouCompleteMe Settings
let g:ycm_semantic_triggers = {'haskell' : ['.hs']}


"===> Haskell configs
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsInfo<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsClear<CR>

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" hindent 
let g:hindent_on_save = 1
let g:hindent_indent_size = 2
let g:hindent_command = "stack exec -- hindent"

" Stylish haskell
let g:stylish_haskell_command="~/.stylish-haskell.yaml"

"===> Rust configs
let g:rustfmt_autosave = 1

" Auto running files depending on programming language 
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:vert ter python3 "%"<CR>
autocmd FileType go nnoremap <buffer> <F5> :w<CR>:vert ter go run "%"<CR>
autocmd FileType haskell nnoremap <buffer> <F5> :w<CR>:vert ter runhaskell "%"<CR>
autocmd FileType cpp nnoremap <F5> :w<bar>:!g++ % -o %:r && ./%:r<CR>
autocmd FileType c nnoremap <F5> :w<bar>:!gcc % -o %:r && ./%:r<CR>
autocmd FileType rust nnoremap <F5> :w<bar>:!rustc % && ./%:r<CR>
autocmd FileType ruby nnoremap <buffer> <F5> :w<CR>:vert ter ruby %<CR>

"===> Basic Configs
filetype plugin indent on
syntax enable
set cursorline
"set background=light
set ttyfast
set smarttab
set expandtab
set showmatch
set nobackup
set noswapfile
set nowritebackup
set secure
colorscheme gruvbox 
set guifont=Monospace\ 12
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set fillchars+=vert:\$
set t_Co=256
set ruler
set hidden
set number
set updatetime=250
set laststatus=2
set smartindent
set autoindent
set nocindent
set st=4 sw=4 et
set shiftwidth=4
set tabstop=4
set guioptions-=m " remove menubar
set guioptions-=T " remove toolbar
set guioptions-=r " remove right-hand scroll bar
set guioptions-=L " remove left-hand scroll bar
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap te :tabedit<Space>
nnoremap tn :tabnext<Space>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>
inoremap jj <Esc>
vnoremap uu <Esc>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
noremap E ge
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:vert ter python3 "%"<CR>
set colorcolumn=79
