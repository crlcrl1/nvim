-- set highlight for MinuetVirtualText
vim.api.nvim_set_hl(0, 'MinuetVirtualText', { fg = '#7A7E85', italic = true })

require('minuet').setup {
    virtualtext = {
        auto_trigger_ft = {
        },
        keymap = {
            -- accept whole completion
            accept = '<TAB>',
            -- accept one line
            accept_line = '<C-right>',
        },
        show_on_completion_menu = true
    },
    n_completions = 1,
    provider = 'openai_fim_compatible',
    provider_options = {
        openai_fim_compatible = {
            api_key = 'DEEPSEEK_API_KEY',
            name = 'deepseek',
            optional = {
                max_tokens = 512,
                top_p = 0.9,
            },
        },
    },
}
