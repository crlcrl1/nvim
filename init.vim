syntax on
set number
set t_Co=256
set laststatus=1
set encoding=utf-8
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set nofoldenable
set foldmethod=indent
set clipboard+=unnamedplus

set scrolloff=8
set sidescrolloff=8
set cursorline
set colorcolumn=100
set mouse=a
set shiftround
set shiftwidth=4

set wildmenu

set pumheight=10
set pumwidth=40
set nowrap

lua require("keybindings")
lua require("basic")
lua require("plugins")

colorscheme arctic

let g:floaterm_shell = 'zsh'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.8
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'

nmap <silent> <C-s> :w<CR>
imap <silent> <C-s> <Esc>:w<CR>i


noremap <silent> <leader>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1

" popup
nmap <leader>t <Plug>(coc-translator-p)
vmap <leader>t <Plug>(coc-translator-pv)
" echo
nmap <leader>e <Plug>(coc-translator-e)
vmap <leader>e <Plug>(coc-translator-ev)
" replace
nmap <leader>r <Plug>(coc-translator-r)
vmap <leader>r <Plug>(coc-translator-rv)

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" ------------------------------ vista.vim --------------------------------------
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_sidebar_width = 35
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_floating_border = "rounded"
let g:vista_cursor_delay=0
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
            \   "function": "\u0192",
            \   "variable": "",
            \   "constructor": "󰘦",
            \  }
nnoremap <silent><nowait> <space>m :Vista!!<cr>

" -------------------------------------- coc.nvim --------------------------------------
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

nnoremap <silent> <Leader>gv :Gvdiffsplit<CR>

if exists("g:neovide")
    let g:transparent_groups = []
else
    let g:transparent_groups = ['Normal', 'Comment', 'Constant', 'Special', 'Identifier',
                \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer']
    " Pmenu
    let g:transparent_groups += ['Pmenu']

    " coc.nvim
    let g:transparent_groups += ['NormalFloat', 'CocFloating']

    " bufferline.nvim
    let g:transparent_groups += ['BufferLineFill']
endif


autocmd BufEnter *.rs hi CocSemTypeMacro guifg=#FFC0A0
autocmd BufLeave *.rs hi CocSemTypeMacro guifg=#C56FFF
au BufNewFile,BufRead *.wgsl set filetype=wgsl
au BufNewFile,BufRead *.ll set filetype=llvm
