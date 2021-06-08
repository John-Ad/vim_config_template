set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"call vundle#begin('~/some/path/here')
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" PUT PLUGINS HERE
Plugin 'sheerun/vim-polyglot'
Plugin 'sainnhe/sonokai'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'dyng/ctrlsf.vim'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tpope/vim-dispatch'
Plugin 'pangloss/vim-javascript'    " JavaScript support
Plugin 'leafgarland/typescript-vim' " TypeScript syntax
Plugin 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
" ------END OF PLUGINS------------------------------

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

"-------------------------VUNDLE STUFF END------------------------------------


" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

"	additions to base file
set nu			" Enable line numbers
syntax on		" enable syntax highlighting
	"	spacing
set tabstop=4		" how many spaces a tab has
set shiftwidth=4	" how many spaces a shift moves
set expandtab		" use spaces when tabbing
	"	searching
set incsearch		" enable incremental search
set hlsearch		" enable highlight search
	"	built in terminal settings
set termwinsize=12x0	" set terminal size
set splitbelow		" always split below
    "   set window size
set lines=35
    "   set colour scheme
set background=dark
colorscheme sonokai

"   NERDTree settings
let NERDTreeShowBookmarks = 1   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinPos = 'left'     " Panel opens on the left side
let NERDTreeWinSize = 31        " Set panel width to 31

"   Tagbar settings
    " Focus the panel when opening it
let g:tagbar_autofocus = 1
    " Highlight the active tag
let g:tagbar_autoshowtag = 1
    " Make panel vertical and place on the right
let g:tagbar_position = 'botright vertical'
    " Mapping to open and close the panel
nmap <F8> :TagbarToggle<CR>

"   ctrlFS settings
    " Use the ack tool as the backend
let g:ctrlsf_backend = 'ack'
    " Auto close the results panel when opening a file
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }
    " Immediately switch focus to the search window
let g:ctrlsf_auto_focus = { "at":"start" }
    " Don't open the preview window automatically
let g:ctrlsf_auto_preview = 0
    " Use the smart case sensitivity search scheme
let g:ctrlsf_case_sensitive = 'smart'
    " Normal mode, not compact mode
let g:ctrlsf_default_view = 'normal'
    " Use absoulte search by default
let g:ctrlsf_regex_pattern = 0
    " Position of the search window
let g:ctrlsf_position = 'right'
    " Width or height of search window
let g:ctrlsf_winsize = '46'
    " Search from the current working directory
let g:ctrlsf_default_root = 'cwd'
    " (Ctrl+F) Open search prompt (Normal Mode)
nmap <C-F>f <Plug>CtrlSFPrompt
    " (Ctrl-F + f) Open search prompt with selection (Visual Mode)
xmap <C-F>f <Plug>CtrlSFVwordPath
    " (Ctrl-F + F) Perform search with selection (Visual Mode)
xmap <C-F>F <Plug>CtrlSFVwordExec
    " (Ctrl-F + n) Open search prompt with current word (Normal Mode)
nmap <C-F>n <Plug>CtrlSFCwordPath
    " (Ctrl-F + o )Open CtrlSF window (Normal Mode)
nnoremap <C-F>o :CtrlSFOpen<CR>
    " (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
nnoremap <C-F>t :CtrlSFToggle<CR>
    " (Ctrl-F + t) Toggle CtrlSF window (Insert Mode)
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

"   FSwitch settings
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h let b:fswitchdst = 'cpp,c'
nmap <C-Z> :vsplit <bar> :wincmd l <bar> :FSRight<CR>

"   protodef settings
    " Pull in prototypes
nmap <buffer> <silent> <leader> ,PP
    " Pull in prototypes without namespace definition"
nmap <buffer> <silent> <leader> ,PN

"   vim-dispatch settings
    " Open vim-dispatch window and scroll to bottom
nnoremap    <C-m>m    :Copen<CR> <bar> G
    " Build debug and release targets
nnoremap    <C-m>b   :Dispatch! make -C build<CR>

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

