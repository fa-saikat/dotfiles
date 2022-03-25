" Coc Tab Compleltion
	inoremap <silent><expr> <TAB>
	      \ pumvisible() ? "\<C-n>" :
	      \ <SID>check_back_space() ? "\<TAB>" :
	      \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Rust autofmt on save
	let g:rustfmt_autosave = 1

" Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Custom
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Fix autofix problem of current line
nmap qf <Plug>(coc-fix-current)

" Remap for do codeAction of current line
nmap <leader>ca  <Plug>(coc-codeaction-line)

" Select inside function. Recommend mapping:
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>

" List errors
" nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

" rename the current word in the cursor
nmap <leader>r  <Plug>(coc-rename)
" nmap <leader>cf  <Plug>(coc-format-selected)
" vmap <leader>cf  <Plug>(coc-format-selected)
