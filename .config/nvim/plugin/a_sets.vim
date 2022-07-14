" Behavior
	syntax on
	set tabstop=4
	set shiftwidth=4
    set scrolloff=10
	set expandtab
	set mouse=a
	set encoding=utf-8
	filetype plugin on
	set timeoutlen=500
	set splitbelow splitright
	set foldmethod=indent
	set conceallevel=2
	set autoindent
	set wrap linebreak nolist
	set shortmess+=c
	nnoremap c "_c
	set ignorecase
    set smartcase
	set noswapfile
	set nobackup
	set nowritebackup
	set undodir=~/.nvim/undodir
	set undofile
	" set emoji
	" set termguicolors " Opaque Background
    " set lbr
    set tw=80


" vim-interface
	set t_Co=256
	if has('termguicolors')
		set termguicolors
	endif
	set hidden
	set ruler
	set cursorline
	set number relativenumber
	set cmdheight=1
	set noshowmode
	set nohlsearch
	set bg=dark

" Command Completion
	set wildmenu
	set wildmode=longest:full,full
