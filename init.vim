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
lua require("plugin-config/ufo")
lua require("nvim-lastplace").setup()
lua require("plugin-config/tabout")
" lua require("plugin-config/statuscol")
lua require("sentiment").setup()
lua require("plugin-config/notify")
lua require("plugin-config/noice")
lua require("plugin-config/lualine")
lua require("plugin-config/comment")
lua require("plugin-config/indent-blankline")
lua require("plugin-config/copilot-chat")

lua require("debuggers/dap")
lua require("debuggers/cpp")
lua require("debuggers/ui")
lua require("debuggers/python")
lua require("debuggers/java")
lua require('nvim-dap-repl-highlights').setup()


let g:floaterm_shell = 'zsh'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.8
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

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

" 默认情况下，在注释分隔符后添加空格
let g:NERDSpaceDelims = 1

" 按行对齐注释分隔符左对齐，而不是按代码缩进
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

let g:transparent_groups = ['Normal', 'Comment', 'Constant', 'Special', 'Identifier',
            \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
            \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer']
" Pmenu
let g:transparent_groups += ['Pmenu']

" coc.nvim
let g:transparent_groups += ['NormalFloat', 'CocFloating']

" bufferline.nvim
let g:transparent_groups += ['BufferLineFill']

" lualine
" let g:transparent_groups += ['lualine']

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

nnoremap <silent> <Leader>i :call InitCpp()<CR>

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
        exec "AsyncRun -mode=term -pos=right cargo run --release"
    elseif &filetype == 'cmake'
        if empty(glob('%:p:h/build/'))
            silent exec "!mkdir %:p:h/build/"
        endif
        exec "AsyncRun -mode=term -pos=right cd %:p:h/build && echo \"\\033[36mConfigurating the project...\\033[0m\\n\" && cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -G Ninja && echo \"\\033[36mCompiling...\\033[0m\\n\" && cmake --build . -j20"
    elseif &filetype == 'make'
        exec "AsyncRun -mode=term -pos=right cd %:p:h && echo \"\\033[36mRunning make clean...\\033[0m\\n\" && make clean && echo \"\\033[36mmaking...\\033[0m\\n\" && make"
    elseif &filetype == 'markdown'
        exec "CocCommand markdown-preview-enhanced.openPreview"
    elseif &filetype == 'cuda'
        exec "AsyncRun -mode=term -pos=right cd %:p:h && echo \"\\033[36mCompiling with nvcc...\\033[0m\\n\" && nvcc %:t -o %:t:r -g && echo \"\\033[36mRunning the program...\\033[0m\\n\" && ./%:t:r"
    endif
endfunction

nnoremap <silent> <Leader>r :call Compile_and_run()<CR>

function! Compile_for_debugging()
    exec "w"
    if &filetype == 'c'
        exec "AsyncRun -mode=term -pos=right cd %:p:h && echo \"\\033[36mCompiling with gcc...\\033[0m\\n\" && gcc %:t -O0 -g -o %:t:r"
    elseif &filetype == 'cpp'
        exec "AsyncRun -mode=term -pos=right cd %:p:h && echo \"\\033[36mCompiling with g++...\\033[0m\\n\" && g++ %:t -O0 -g -o %:t:r"
    elseif &filetype == 'java'
        exec "AsyncRun -mode=term -pos=right cd %:p:h && echo \"\\033[36mCompiling with javac...\\033[0m\\n\" && javac %:t -d ../out"
    elseif &filetype == 'rust'
        exec "AsyncRun -mode=term -pos=right cargo build"
    elseif &filetype == 'cmake'
        if empty(glob('%:p:h/build/'))
            silent exec "!mkdir %:p:h/build/"
        endif
        exec "AsyncRun -mode=term -pos=right cd %:p:h/build && echo \"\\033[36mConfigurating the project...\\033[0m\\n\" && cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -G Ninja && echo \"\\033[36mCompiling...\\033[0m\\n\" && cmake --build ."
    elseif &filetype == 'make'
        exec "AsyncRun -mode=term -pos=right cd %:p:h && echo \"\\033[36mRunning make clean...\\033[0m\\n\" && make clean && echo \"\\033[36mmaking...\\033[0m\\n\" && make"
    elseif &filetype == 'cuda'
        exec "AsyncRun -mode=term -pos=right cd %:p:h && echo \"\\033[36mCompiling with nvcc...\\033[0m\\n\" && nvcc %:t -o %:t:r -g -O0"
    endif
endfunction

nnoremap <silent> <C-g> :call Compile_for_debugging()<CR>


