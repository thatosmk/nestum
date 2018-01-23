set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim/bundle')

 " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-rails'
" nerdtree plugin for vim

" forces tmux splits to behave like vim splits
Plugin 'christoomey/vim-tmux-navigator'


 " The following are examples of different formats supported.
 " Keep Plugin commands between vundle#begin/end.
 " plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
 " plugin from http://vim-scripts.org/vim/scripts.html
 " Plugin 'L9'
 " Git plugin not hosted on GitHub
 "Plugin 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (i.e. when working on your own plugin)
 "Plugin 'file:///home/gmarik/path/to/plugin'
 " The sparkup vim script is in a subdirectory of this repo called vim.
 " Pass the path to set the runtimepath properly.
 "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 " Install L9 and avoid a Naming conflict if you've already installed a
 " different version somewhere else.
 " Plugin 'ascenator/L9', {'name': 'newL9'}

 " for Ruby snippets
 " Plugin 'garbas/vim-snipmate'
 " vim html by mats
Plugin 'mattn/emmet-vim'
 " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
filetype plugin on
 "
 " Brief help
":PluginList       " - lists configured plugins
" :PluginInstall    " - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean     " - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
execute pathogen#infect()
call pathogen#helptags()

" show language syntax highlighted
syntax on

map ; :

" show numbers on the LSP
set number

" add completeoption
"
" turn on wildmenu
set wildmenu
set rnu

" set the colorscheme
" colorscheme solarized

" set backgroung to dark= for the dark verison
set background=dark

" set background to light = for the light version
" set background=light
"
if has('gui_running')
    set background=light
else
    set background=dark
endif

" always show the current position
set ruler

" ignore case when searching
set ignorecase

" make search act like search in modern browsers
set incsearch

" For regular expressions turn on magic
set magic

" show brackets match
set showmatch

" set auto indent
set ai

" set tabs spaces to be 4 instead of 8
set tabstop=4

" set wrap lines
set wrap

" Always show the status line
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


" Sets how many lines of history VIM has to remember
set history=500

" html emmet
let g:user_emmet_mode='n'    "only enable normal mode functions
let g:user_emmet_mode='a'    "enable all function in all mode.
