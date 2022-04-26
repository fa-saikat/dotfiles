" serenade Settings
    let g:serenade_enable_italic = 1
    let g:serenade_transparent_background = 1
    let g:serenade_diagnostic_text_highlight = 1
    let g:serenade_diagnostic_line_highlight = 0

" ocenic-next settings
" Neovim >= 0.1.5
    if (has("termguicolors"))
        set termguicolors
    endif

    let g:oceanic_next_terminal_bold = 1
    let g:oceanic_next_terminal_italic = 1

" Indentline Settings
" Vim
    let g:indentLine_color_term = 239

" GVim
    let g:indentLine_color_gui = '#666666'

" none X terminal
    let g:indentLine_color_tty_light = 4 " (default: 4)
    let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
    let g:indentLine_bgcolor_term = 202
    let g:indentLine_bgcolor_gui = '#cc608c75'

" Set Colorscheme
    colorscheme OceanicNext
    let g:lightline.colorscheme = 'oceanicnext'
