set nocompatible              " be iMproved, required
filetype off                  " required

set runtimepath^=~/.vim/bundle/ctrlp.vim
set rtp+=~/.vim/bundle/nerdtree.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
" Line numbers
Bundle "myusuf3/numbers.vim"
Bundle 'Valloric/YouCompleteMe'
Bundle 'StanAngeloff/php.vim'
Plugin 'docunext/closetag.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
"Plugin 'spf13/PIV'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'rking/ag.vim'
Bundle 'mattn/webapi-vim'
"Plugin 'scrooloose/syntastic'
Plugin 'PDV--phpDocumentor-for-Vim'
Plugin 'Raimondi/delimitMate'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'pangloss/vim-javascript'
Plugin 'airblade/vim-gitgutter'
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

nnoremap <F2> :set invpaste paste?<CR>

set pastetoggle=<F2>
set showmode

"CtrlP Settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

syntax on
set autoindent
set tw=79
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set matchpairs+=<:>         " show matching <> (html mainly) as well
set number                  " Display line numbers
set nopaste
set backspace=indent,eol,start
set hlsearch                " Highlight searches by default.
set cursorline
set cursorcolumn
set noeb
set novb
set ruler
au FileType gitcommit set tw=72

set autoread                  " watch for file changes
set showmatch           " Show matching brackets.
set incsearch           " Incremental search
set autoindent smartindent    " auto/smart indent
set history=200
set cmdheight=1
"Backup
set backup
set backupdir=~/.vim/bkp
set laststatus=2            " Always show statusline, even if only 1 window.
set conceallevel=0
" size of an "indent"
set shiftwidth=4
set nowrap
let g:vim_json_syntax_conceal = 0
"set mouse=a
set noet ci pi sts=0 sw=4 ts=4

set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=8
"autocmd VimEnter,Colorscheme * :IndentGuidesEnable 

autocmd CompleteDone * pclose

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

autocmd FileType php inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-D> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-D> :call PhpDocRange()<CR>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>
