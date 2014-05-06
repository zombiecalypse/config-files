filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" BEGIN Bundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'christoomey/vim-tmux-navigator'

" END Bundles

let mapleader=","

filetype plugin indent on

" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

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

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
  filetype plugin on
endif

set nohlsearch
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

let g:haddock_browser = "/usr/bin/google-chrome"
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd	" Show (partial) command in status line.
set showmatch	" Show matching brackets.
set ignorecase	" Do case insensitive matching
set smartcase	" Do smart case matching
set incsearch	" Incremental search
set autowrite	" Automatically save before commands like :next and :make
set hidden	" Hide buffers when they are abandoned
set mouse=a	" Enable mouse usage (all modes) in terminals
set acd
set dir=/tmp,.,/var/tmp
set fo=tcroq
colorscheme default

set modeline
"  ---------------------------------------------------------------------------
"  hotkeys
"  ---------------------------------------------------------------------------
map		<silent>	<F2>	:write<CR>
map		<silent>	<F3>	:Explore<CR>
map 		<silent>	<F4>	:Gstatus<CR>
map 		<silent>	<F5>	:Gcommit<CR>
imap 		<silent>	<F4>	:Gstatus<CR>
imap 		<silent>	<F5>	:Gcommit<CR>
noremap		<silent>	<F11>	<Esc><Esc>:TlistToggle<CR>
inoremap	<silent>	<F11>	<Esc><Esc>:TlistToggle<CR>
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

call pathogen#infect()
let g:jedi#popup_on_dot = 0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeIgnore = ['\~$', '\.png$', '\.svg$', '\.ogg$', '\.o$', '\.hi$', '\.lhs$', '\.lksh[sw]$','\.pyc$']
let g:ScreenImpl = 'Tmux'
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

nmap <silent> <C-k> <C-w>k
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-l> <C-w>l
nmap <silent> <F6> :FSHere<cr>
nmap <silent> <leader>h :FSHere<cr>
nmap <silent> <C-g> :nohl<CR><C-l>
nmap <silent> <leader>a :A<CR>

nmap ,s ^[:w^M:!aspell -c --dont-backup "%"^M:e! "%"^M^M
nmap <silent> <leader>g :! flux google-chrome "https://google.com/\#q=<cword>"<CR>

set tags=./tags;/
