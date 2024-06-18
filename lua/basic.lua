vim.o.foldcolumn = '0'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true



vim.cmd [[
    autocmd BufReadPre * NvimTreeClose
]]


vim.cmd [[
    autocmd BufWrite * lua require('bufferline.diagnostics').refresh_coc_diagnostics()
]]


vim.cmd [[
    autocmd BufWrite * lua require("nvim-tree.diagnostics").update()
]]
