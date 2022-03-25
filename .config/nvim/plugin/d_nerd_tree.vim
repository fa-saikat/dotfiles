" " Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

" " Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" " Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif


" Nerd tree
nnoremap <F2> :NERDTreeToggle<CR>
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeDirArrowExpandable="\u00a0"
let NERDTreeDirArrowCollapsible="\u00a0"
