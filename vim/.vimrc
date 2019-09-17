

" General

set number            " show line numbers
set wrap              " enable word wrap
set wildmenu          " visual auto complete menu for command menu
set showmatch         " highlight matching branket and parantheses
set incsearch         " search as characters entered
set hlsearch          " highlight matches in search
set autoread          " reload file if updated outside vim
syntax enable


" Editing

set encoding=utf-8
set tabstop=4
set autoindent
set smartindent


" Appereance

colorscheme slate     " color scheme
" put colorscheme files in ~/.vim/colors/
set cursorline        " highlight current line
hi CursorLine term=bold cterm=bold guibg=Grey40


" Keymaps
let mapleader=" "     " Leader key
nmap <Leader>r :source ~/.vimrc<CR>
" quick navigation between open tabs
nmap <Leader><Left> :bp<CR>
nmap <Leader><Right> :bn<CR>
nmap <Leader>1 :bfirst<CR>
nmap <Leader>2 :bfirst<CR>:bn<CR>
nmap <Leader>3 :bfirst<CR>:2bn<CR>
nmap <Leader>4 :bfirst<CR>:3bn<CR>
nmap <Leader>5 :bfirst<CR>:4bn<CR>
" navigation shortcuts
nmap <Leader>t :NERDTreeToggle<CR>
nmap <Leader>w :bw<CR>
nmap <Leader>Q :q<CR>


" Init plugin manager Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'


" Plugins
Plugin 'tpope/vim-surround'           " add surrounding quotes, parantheses, tags quickly
Plugin 'scrooloose/nerdtree'          " tree folder/project view
Plugin 'Xuyuanp/nerdtree-git-plugin'  " NERDTree git flags
Plugin 'vim-airline/vim-airline'      " styled vim statusbar
Plugin 'valloric/youcompleteme'       " auto complete support
Plugin 'mattn/emmet-vim'              " Emmet
Plugin 'tpope/vim-commentary'         " comment/uncomment quickly
Plugin 'sheerun/vim-polyglot'         " tons of language support (syntax, indentation...)
Plugin 'junegunn/goyo.vim'            " distraction free writing
Plugin 'godlygeek/tabular'            " align multi lines with delimeters - required for markdown
Plugin 'plasticboy/vim-markdown'      " markdown features
Plugin 'dense-analysis/ale'           " lint helper (eslint...)
Plugin 'terryma/vim-multiple-cursors' " multiple cursor editing features
Plugin 'terryma/vim-expand-region'    " expands selection to parent enclosing region


" All of your Plugins must be added before the following line
call vundle#end()


" Plugin configurations

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1
"let g:NERDTreeWinPos = "right"
" Open NERDTree when vim is opened with a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Quit vim if NERDTree is the only buffer left in the open tabs
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" enable tab bar in vim-airline statusbar
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'


" File type specific configuration
au BufRead,BufNewFile Podfile set filetype=ruby

