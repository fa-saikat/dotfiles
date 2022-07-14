" Clipboard Remap
	vnoremap <leader>y  "+y
	nnoremap <leader>Y  "+yg_
	nnoremap <leader>y  "+y
	nnoremap <leader>yy  "+yy
	nnoremap <leader>p "+p
	nnoremap <leader>P "+P
	vnoremap <leader>p "+p
	vnoremap <leader>P "+P

" TagBar
	" nmap <leader>f :Goyo<CR>

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

" GitGutter
	nmap ) <Plug>(GitGutterNextHunk)
	nmap ( <Plug>(GitGutterPrevHunk)

" Goyo
	noremap <leader>g :Goyo<CR>

"Buffer Navigation
	noremap <Tab> :bn<CR>
	noremap <S-Tab> :bp<CR>
	noremap <C-t> :tabnew<CR>
	noremap <C-w> :Bclose<CR>

" UndoTree
	nnoremap <F5> :UndotreeToggle<CR>

" Limelight
    map <Leader>ll :Limelight!!<CR>

" Replace all is aliased to S.
	" nnoremap S :%s//g<Left><Left>
	nnoremap S *:%s///g<left><left>

" Sort paragrapgh
    vnoremap <leader>so :'<'>sort<CR>

" Tabularize
    " nmap <Leader>a= :Tabularize /=<CR>
    " vmap <Leader>a= :Tabularize /=<CR>
    " nmap <Leader>a: :Tabularize /:\zs<CR>
    " vmap <Leader>a: :Tabularize /:\zs<CR>


