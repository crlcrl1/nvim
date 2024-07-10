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

if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font:h23"
    vim.opt.linespace = 0
    vim.g.neovide_transparency = 0.7
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_refresh_rate = 165
end
