vim.o.foldcolumn = '0'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "󰨄",
        }
    },
    update_in_insert = true,
    severity_sort = true,
})



vim.cmd [[
    autocmd BufReadPre * NvimTreeClose
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
    vim.g.neovide_opacity = 1
    vim.g.neovide_normal_opacity = 0.8
    vim.g.neovide_hide_mouse_when_typing = false
    vim.g.neovide_floating_corner_radius = 0.3
    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 10
    vim.g.neovide_cursor_smooth_blink = true
    vim.g.neovide_cursor_animate_in_insert_mode = true
end


vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.rs",
    command = "hi CocSemTypeMacro guifg=#FFC0A0",
})
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*.rs",
    command = "hi CocSemTypeMacro guifg=#C56FFF",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.wgsl",
    command = "set filetype=wgsl",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.ll",
    command = "set filetype=llvm",
})

vim.diagnostic.config({
    virtual_lines = { current_line = false }
})
