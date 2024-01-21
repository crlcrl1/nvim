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

" colorscheme moonfly
colorscheme arctic

let g:moonflyCursorColor = v:true
lua require("plugins")
lua require("keybindings")
lua require("basic")
lua require("plugin-config/nvim-tree")
lua require("plugin-config/nvim-treesitter")
lua require("plugin-config/coc")
lua require("plugin-config/alpha")
lua require("plugin-config/telescope")
lua require("plugin-config/project")
lua require("plugin-config/bufferline")
lua require("colorizer").setup()
lua require("scrollbar").setup()
lua require("plugin-config/ufo")
lua require("nvim-lastplace").setup()
lua require("plugin-config/tabout")
lua require("colorful-winsep").setup()

let g:floaterm_shell = 'zsh'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.8
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>i

let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = ' '
let airline#extensions#coc#warning_symbol = ' '
let g:airline#extensions#coc#show_coc_status = 1
let airline#extensions#coc#stl_format_err = '%C(L%L)'
let airline#extensions#coc#stl_format_warn = '%C(L%L)'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_theme = 'jellybeans'

noremap <leader>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" popup
nmap <leader>t <Plug>(coc-translator-p)
vmap <leader>t <Plug>(coc-translator-pv)
" echo
nmap <leader>e <Plug>(coc-translator-e)
vmap <leader>e <Plug>(coc-translator-ev)
" replace
nmap <leader>r <Plug>(coc-translator-r)
vmap <leader>r <Plug>(coc-translator-rv)

" 默认情况下，在注释分隔符后添加空格
let g:NERDSpaceDelims = 1

" 按行对齐注释分隔符左对齐，而不是按代码缩进
let g:NERDDefaultAlign = 'left'

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" ------------------------------ vista.vim --------------------------------------
function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
            \   "function": "\u0192",
            \   "variable": "",
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

nnoremap <Leader>gv :Gvdiffsplit<CR>

function! InitCpp()
    if &filetype == 'cmake'
        if empty(glob('%:p:h/build/'))
            exec "!mkdir %:p:h/build/"
        endif
        exec "AsyncRun cd %:p:h/build && cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -G Ninja"
    elseif &filetype == 'make'
        exec "AsyncRun cd %:p:h && make clean && bear -- make && make clean"
    endif
    if &filetype == 'cuda'
        silent exec "!cp ~/.clangd %:p:h"
    endif
    if !filereadable('%:p:h/.clang-format')
        silent exec "!cp ~/.clang-format %:p:h"
    endif
endfunction

nnoremap <Leader>i :call InitCpp()<CR>

function! Compile_and_run()
    exec "w"
    if &filetype == 'c'
        exec "AsyncRun -mode=term -pos=right cd %:p:h && echo \"\\033[36mCompiling with gcc...\\033[0m\\n\" && gcc %:t -O2 -o %:t:r && echo \"\\033[36mRunning the program...\\033[0m\\n\" && ./%:t:r"
    elseif &filetype == 'cpp'
        exec "AsyncRun -mode=term -pos=right cd %:p:h && echo \"\\033[36mCompiling with g++...\\033[0m\\n\" && g++ %:t -O2 -o %:t:r && echo \"\\033[36mRunning the program...\\033[0m\\n\" && ./%:t:r"
    elseif &filetype == 'java'
        exec "AsyncRun -mode=term -pos=right cd %:p:h && echo \"\\033[36mCompiling with javac...\\033[0m\\n\" && javac %:t -d ../out && cd ../out && echo \"\\033[36mRunning the program...\\033[0m\\n\" && java %:t:r"
    elseif &filetype == 'python'
        exec "AsyncRun -mode=term -pos=right cd %:p:h && python3 %:t"
    elseif &filetype == 'rust'
        exec "AsyncRun -mode=term -pos=right cargo run"
    elseif &filetype == 'cmake'
        if empty(glob('%:p:h/build/'))
            silent exec "!mkdir %:p:h/build/"
        endif
        exec "AsyncRun -mode=term -pos=right cd %:p:h/build && echo \"\\033[36mConfigurating the project...\\033[0m\\n\" && cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -G Ninja && echo \"\\033[36mCompiling...\\033[0m\\n\" && cmake --build ."
    elseif &filetype == 'make'
        exec "AsyncRun -mode=term -pos=right cd %:p:h && echo \"\\033[36mRunning make clean...\\033[0m\\n\" && make clean && echo \"\\033[36mmaking...\\033[0m\\n\" && make"
    elseif &filetype == 'markdown'
        exec "CocCommand markdown-preview-enhanced.openPreview"
    elseif &filetype == 'cuda'
        exec "AsyncRun -mode=term -pos=right cd %:p:h && echo \"\\033[36mCompiling with nvcc...\\033[0m\\n\" && nvcc %:t -o %:t:r && echo \"\\033[36mRunning the program...\\033[0m\\n\" && ./%:t:r"
    endif
endfunction

nnoremap <F5> :call Compile_and_run()<CR>
