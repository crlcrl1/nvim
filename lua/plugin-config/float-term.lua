local float_term = require('FloatTerm')
float_term.setup({
    window_config = {
        border = 'rounded',
        title = 'Terminal',
        title_pos = 'left',
    },
    pad_vertical = 5,
    pad_horizontal = 10,
})
vim.keymap.set('n', '<F12>', float_term.toggle_window, {
    noremap = true,
    desc = 'Toggle floating terminal',
})
