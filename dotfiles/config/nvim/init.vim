"            _                              __ _       
" _ ____   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _ 
"| '_ \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
"| | | \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
"|_| |_|\_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                |___/ 

" Plug Config
call plug#begin('~/.nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sbdchd/neoformat'
Plug 'glepnir/dashboard-nvim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'

call plug#end()

"====================
"CMNDS
"====================
"
let g:airline_theme='minimalist'		" Airline Theme Config
let g:airline_powerline_fonts=1			" Ariline Powerline Fonts
syntax enable					" Enable Syntax Highlighting
set nu						" Enable Line Numbers

set splitbelow splitright			" Defaults New Splits to open to the Bottom/Right

" Dashboard
let g:dashboard_custom_header = [
\ "                       _           ",	
\ " _ __   ___  _____   _(_)_ __ ___  ",		
\ "| '_ \\ / _ \\/ _ \\ \\ / / | '_ ` _ \\ ",	
\ "| | | |  __/ (_) \\ \V \/| | | | | | |",	
\ "|_| |_|\\___|\\___/ \\_/ |_|_| |_| |_|",	
\ "				      ",	
\ "              neovim               ",	
\]

"====================
"KEYBINDS
"====================
"
noremap <SPACE> <Nop>	
let mapleader="Space"				" Map Leader to Space

map <C-n> :set rnu!<Cr>				" Set Realative Line Numbers

let g:user_emmet_leader_key='<C-z>'		" Emmet Leader Key rebind
