runtime! debian.vim
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-unimpaired'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rking/ag.vim'
Plugin 'spf13/vim-preview'
Plugin 'Chiel92/vim-autoformat'
Plugin 'jnwhiteh/vim-golang'
Plugin 'bitc/vim-hdevtools'
Plugin 'Twinside/vim-haskellFold'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'godlygeek/tabular'
Plugin 'sjl/gundo.vim'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'klen/python-mode'
Plugin 'bogado/file-line'
Plugin 'python-rope/ropemode'
Plugin 'python-rope/ropevim'
call vundle#end()
set rtp+=~/.vim/bundle/Vundle.vim

filetype plugin indent on
let mapleader=","

" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal! g'\"" | endif
"endif


let mapleader = ","

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
  filetype plugin on
endif

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

let g:haddock_browser = "/usr/bin/google-chrome"
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd	" Show (partial) command in status line.
set showmatch	" Show matching brackets.
set nohlsearch
set ignorecase	" Do case insensitive matching
set smartcase	" Do smart case matching
set incsearch	" Incremental search
set autowrite	" Automatically save before commands like :next and :make
set mouse=a	" Enable mouse usage (all modes) in terminals
set acd
set hidden
set dir=/tmp,.,/var/tmp
set fo=tcroq
set list listchars=tab:»·,trail:·,extends:↪,precedes:↩
colorscheme pyte

set modeline
set tabstop=2 shiftwidth=2 expandtab
set nu
"  ---------------------------------------------------------------------------
"  hotkeys
"  ---------------------------------------------------------------------------
map		<silent>	<F2>	:write<CR>
map		<silent>	<F3>	:Gdiff<CR>
map 		<silent>	<F5>	:Gstatus<CR>
imap 		<silent>	<F5>	<Esc><Esc>:Gstatus<CR>
"
imap		<silent>	<F2>	<Esc>:write<CR>

map 		<silent>	<F9>	:make<CR>
imap 		<silent>	<F9>	<Esc>:make<CR>

au FileType markdown map <silent> <F9> :!see-markdown %<CR>
au FileType markdown imap <silent> <F9> <Esc>:!see-markdown %<CR>
" ----------------------------------------------------------------------------
" filename completition
set wildmenu
set wildignore=*.bak,*.o,*.e,*~
" ----------------------------------------------------------------------------
" Git statusline
set laststatus=2
set statusline=%F%m%r%h%w\ -\ %{fugitive#statusline()}%=%v-%l[%p%%]
"
set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ make\ -C\ ..

" ----------------------------------------------------------------------------
"  me
" ----------------------------------------------------------------------------
let s:AuthorName	= 'Aaron Karper'
let s:AuthorRef		= 'AK'
let s:Company		= 'Universität Bern'
let s:Email		= 'aaron@karper.ch'
" ---------------------------------------------------------------------------
"  bash me
" ---------------------------------------------------------------------------
let g:BASH_AuthorName	= s:AuthorName
let g:BASH_AuthorRef	= s:AuthorRef
let g:BASH_Company	= s:Company
let g:BASH_Email	= s:Email
" ---------------------------------------------------------------------------
"  py me
" ---------------------------------------------------------------------------
let g:Python_AuthorName	= s:AuthorName
let g:Python_AuthorRef	= s:AuthorRef
let g:Python_Company	= s:Company
let g:Python_Email	= s:Email
" ---------------------------------------------------------------------------
" IDE VIM
" ---------------------------------------------------------------------------
let g:proj_window_width = 30 
let g:proj_window_increment = 50
" ---------------------------------------------------------------------------
"  Template
" ---------------------------------------------------------------------------
let g:tskelUserName  = s:AuthorName
let g:tskelUserEmail = s:Email
let g:tskelUserWWW   = 'aaron.karper.ch'
"
" Source a global configuration file if available
if filereadable("/etc/vimrc")
  source /etc/vimrc
endif

let g:jedi#popup_on_dot = 0
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

map <leader>a :A<CR>
map <leader>A :AS<CR>
" Copy to X CLIPBOARD
map <leader>cp :w !xsel -i -p<CR>
" Paste from X CLIPBOARD
map <leader>pp :r!xsel -p<CR>
set wildmode=longest,list,full
set wildmenu
let Grep_Default_Options = '-i' 
let Grep_Skip_Files = '*.bak *~ *.jar' 
map <silent> <C-Right> <c-w>l
map <silent> <C-Left> <c-w>h
map <silent> <C-Up> <c-w>k
map <silent> <C-Down> <c-w>j
map <silent> <C-L> <c-w>l
map <silent> <C-H> <c-w>h
map <silent> <C-K> <c-w>k
map <silent> <C-J> <c-w>j


nmap <silent> <C-k> <C-w>k
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-l> <C-w>l
nmap <silent> <C-g> :nohl<CR><C-l>
nmap <silent> <space> za

let g:rails_projections = {
\  "app/jobs/*.rb": {
\    "command": "jobs",
\    "template": "class %S < BaseJob\nend",
\    "test": [
\      "spec/jobs/%s_spec.rb"] },
\  "app/domain/*.rb": {
\    "command": "domain",
\    "template": "module %S\nend",
\    "test": [
\      "spec/domain/%s_spec.rb"] },
\  "app/utils/*.rb": {
\    "command": "utils",
\    "template": "module %S\nend",
\    "test": [
\      "spec/utils/%s_spec.rb"] },
\  "config/*.rb": {
\    "command": "config",},
\  "test/blueprints/*.rb": {
\    "command": "blueprint",},
\ }

autocmd FileType go autocmd BufWritePre <buffer> Fmt
au FileType haskell nnoremap <buffer> <F9> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <S-F9> :HdevtoolsClear<CR>

" Python mode
let g:pymode_options_max_line_length = 79
let g:pymode_trim_whitespaces = 1
let g:pymode_motion = 1
let g:pymode_folding = 1
let g:pymode_indent = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_run = 1
let g:pymode_lint_options_mccabe = { 'complexity': 10 }
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
