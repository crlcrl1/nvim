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
    vim.o.guifont = "JetBrainsMonoNL Nerd Font:h23"
    vim.opt.linespace = 0
    vim.g.neovide_padding_top = 12
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_refresh_rate = 165
    vim.g.neovide_floating_shadow = false
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_cursor_vfx_particle_density = 10.0
end
