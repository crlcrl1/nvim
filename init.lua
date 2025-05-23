vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.laststatus = 1
vim.opt.encoding = "utf-8"
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.foldenable = false
vim.opt.foldmethod = "indent"
vim.opt.clipboard:append("unnamedplus")
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"
vim.opt.mouse = "a"
vim.opt.shiftround = true
vim.opt.wrap = false

vim.opt.wildmenu = true
vim.opt.pumheight = 10
vim.opt.pumwidth = 40

require("keybindings")
require("basic")
require("plugins")

vim.cmd("colorscheme arctic")

vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = "left"

vim.g.vista_icon_indent = { "╰─▸ ", "├─▸ " }
vim.g.vista_default_executive = "coc"
vim.g.vista_sidebar_width = 35
vim.g.vista_echo_cursor_strategy = "floating_win"
vim.g.vista_floating_border = "rounded"
vim.g.vista_cursor_delay = 0
vim.g["vista#renderer#enable_icon"] = 1
vim.g["vista#renderer#icons"] = {
    ["function"] = "\u{0192}",
    ["variable"] = "",
    ["constructor"] = "󰘦",
}
vim.api.nvim_set_keymap("n", "<space>m", ":Vista!!<cr>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "[c", "<Plug>(coc-git-prevconflict)", { silent = true })
vim.api.nvim_set_keymap("n", "]c", "<Plug>(coc-git-nextconflict)", { silent = true })
vim.api.nvim_set_keymap("n", "gs", "<Plug>(coc-git-chunkinfo)", { silent = true })
vim.api.nvim_set_keymap("n", "gc", "<Plug>(coc-git-commit)", { silent = true })
vim.api.nvim_set_keymap("o", "ig", "<Plug>(coc-git-chunk-inner)", { silent = true })
vim.api.nvim_set_keymap("x", "ig", "<Plug>(coc-git-chunk-inner)", { silent = true })
vim.api.nvim_set_keymap("o", "ag", "<Plug>(coc-git-chunk-outer)", { silent = true })
vim.api.nvim_set_keymap("x", "ag", "<Plug>(coc-git-chunk-outer)", { silent = true })

vim.g.transparent_groups = {
    "Normal", "Comment", "Constant", "Special", "Identifier",
    "Statement", "PreProc", "Type", "Underlined", "Todo", "String",
    "LineNr", "NonText", "SignColumn", "CursorLineNr", "EndOfBuffer",
    "Pmenu", "NormalFloat", "CocFloating", "BufferLineFill",
}
