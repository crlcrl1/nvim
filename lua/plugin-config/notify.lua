require('notify').setup({
    stages = "slide",
    on_open = nil,
    on_close = nil,
    timeout = 2000,
    fps = 60,
    render = "default",
    background_colour = "Normal",
    max_width = math.floor(vim.api.nvim_win_get_width(0) / 2),
    max_height = math.floor(vim.api.nvim_win_get_height(0) / 2),
    level = "TRACE",
})
