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
" source ~/.vim/.vimrc.bundles
" Line numbers
Bundle "myusuf3/numbers.vim"
"Bundle 'Valloric/YouCompleteMe'
Bundle 'StanAngeloff/php.vim'
Bundle 'ntpeters/vim-better-whitespace'
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'docunext/closetag.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" set your own custom ignore settings
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$\|test$',
    \ 'file': '\.DS_Store$\|\.so$\|\.dll$\|\.pyc$' }

set list lcs=tab:\|\ 

syntax on
set autoindent
set tw=4
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
set tabstop=4               " <tab> inserts 4 spaces 
set matchpairs+=<:>         " show matching <> (html mainly) as well
set number                  " Display line numbers
set nopaste
set backspace=indent,eol,start
set hlsearch                " Highlight searches by default.
set cursorline
set cursorcolumn
set noeb
set novb
au FileType gitcommit set tw=72

set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ }

function! PhpSyntaxOverride()
      hi! def link phpDocTags  phpDefine
        hi! def link phpDocParam phpType
    endfunction

    augroup phpSyntaxOverride
          autocmd!
            autocmd FileType php call PhpSyntaxOverride()
        augroup END
