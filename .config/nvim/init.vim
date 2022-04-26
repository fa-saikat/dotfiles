" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝

" https://github.com/b4skyx/dotfiles

let mapleader =" "
let maplocalleader = "\\"

" Vim-Plug init
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

" Vim-Plug Plugins

call plug#begin('~/.config/nvim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/gruvbox-material'
Plug 'b4skyx/serenade'
Plug 'joshdick/onedark.vim'
Plug 'Mofiqul/dracula.nvim'
Plug 'mhartington/oceanic-next'

Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
" Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'

Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pechorin/any-jump.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'

Plug 'Yggdroot/indentLine'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'nekonako/xresources-nvim'

Plug 'neoclide/coc-neco'
call plug#end()


" Clipboard
	set go=a
	set clipboard+=unnamedplus

" Clipboard Remap
	vnoremap  <leader>y  "+y
	nnoremap  <leader>Y  "+yg_
	nnoremap  <leader>y  "+y
	nnoremap  <leader>yy  "+yy
	nnoremap <leader>p "+p
	nnoremap <leader>P "+P
	vnoremap <leader>p "+p
	vnoremap <leader>P "+P

" TagBar
	nmap <leader>t :TagbarToggle<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Split Navigation shortcuts
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Keep selection after shift
	vnoremap < <gv
	vnoremap > >gv

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Autogroup
    augroup RELOAD
        autocmd!
        " Close vim when Nerdtree is last window
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        " Disables automatic commenting on newline:
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
        " Automatically deletes all trailing whitespace on save.
        autocmd BufWritePre * %s/\s\+$//e
    augroup END

" GitGutter
	nmap ) <Plug>(GitGutterNextHunk)
	nmap ( <Plug>(GitGutterPrevHunk)
	let g:gitgutter_enabled = 1
	let g:gitgutter_map_keys = 0
	let g:gitgutter_highlight_linenrs = 1

" Goyo
	noremap <leader>g :Goyo<CR>
    let g:goyo_width = 110

" Limelight
    map <Leader>ll :Limelight!!<CR>


" Limelight goyo integation
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!


"Buffer Navigation
	noremap <Tab> :bn<CR>
	noremap <S-Tab> :bp<CR>
	noremap <C-t> :tabnew<CR>
	" noremap <C-w> :tabclose<CR>

" Tab Ident with |
	" set list lcs=tab:\|\ ""

" UndoTree
	nnoremap <F5> :UndotreeToggle<CR>

" Files on ctrl+p
	nnoremap <C-p> :Files<CR>

" Sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Tabularize
    " nmap <Leader>a= :Tabularize /=<CR>
    " vmap <Leader>a= :Tabularize /=<CR>
    " nmap <Leader>a: :Tabularize /:\zs<CR>
    " vmap <Leader>a: :Tabularize /:\zs<CR>

