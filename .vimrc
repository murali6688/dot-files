filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
Plugin 'ncm2/ncm2-path'
Plugin 'sjl/badwolf'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jacoborus/tender'
Plugin 'w0rp/ale'
Plugin 'arcticicestudio/nord-vim'


" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Bundle 'Valloric/YouCompleteMe'

" ...
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

set splitbelow
set splitright

let mapleader = "\<Space>"

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" .py file types
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
    \ let g:pymode_rope_completion = 0

"Other filetypes
au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

:highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
"Flagging white space
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"utf-8 encoding
set encoding=utf-8

if has('gui_running')
    set background=light
    colorscheme tender
else
    colorscheme tender

endif

if (has("termguicolors"))
        set termguicolors
endif

if $COLORTERM == 'gnome-terminal'
        set t_Co=256
endif

syntax enable           " enable syntax processing
set expandtab 		" tabs are spaces
set showcmd             " show command in bottom bar
" set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default

" CTRL + space open/closes folds
nnoremap <C-space> za

" move vertically by visual line
" nnoremap j gj
" nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>


" highlight last inserted text
nnoremap gV `[v`]

" jk is escape
inoremap jk <esc>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session
nnoremap <leader>s :mksession<CR>

" open ag.vim
nnoremap <leader>a :Ag

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'


" Section Name {{{
set number "This will be folded
" }}}





let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set nu rnu
set number relativenumber
set clipboard=unnamed



let g:SuperTabDefaultCompletionType = "context"
let g:airline_section_x=''

" autocmd BufEnter * call ncm2#enable_for_buffer()
augroup vimrc
	    autocmd!
augroup END

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = 'python'

let python_highlight_all=1
syntax on

" Uncomment the following to have Vim jump to the last position when                                                       
" " reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

" for running python script inline
nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>

" Check Python files with flake8 and pylint.
let g:ale_linters = {'python': ['mypy', 'flake8', 'pylint']}
" Fix Python files with black and isort.
let g:ale_fixers = {'python': ['black', 'isort']}

augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: iso-8859-15 -*-\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
augroup END

function! GitBranch()
          return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
      return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

set laststatus=2
