scriptencoding utf-8

augroup AutoCmd
  autocmd!
augroup END

"augroup PluginInstall
"  autocmd!
"  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
"augroup END

let s:plugin_dir = expand('~/.vim/bundle/')
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_dir)
    call mkdir(s:dein_dir, 'p')
    silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_dir, ':p')
endif

if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)
  call dein#add('Shougo/dein.vim')
  
  let s:toml = '~/.dein.toml'
  let s:toml_lazy = '~/.dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
  call dein#recache_runtimepath()
endif

if !has('gui_running')
  set t_Co=256
endif

set encoding=utf-8
set clipboard=unnamed
set relativenumber
set number
set hidden
set incsearch
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
" set autoindent
" set smartindent
set list
set listchars=tab:>\ ,extends:<
set whichwrap=b,s,h,l,<,>,[,]
set showmatch
set smartcase
set nowrapscan
set laststatus=2
set showtabline=2
set noshowmode

set directory=~/.vim/tmp
set backupdir=~/.vim/tmp

syntax enable
set background=dark
let g:solarized_termtrans=1

" Status Line
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

