require 'nvim-tree'.setup {
    git = {
        enable = true
    },
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = "󰨄",
            info = "",
            warning = "",
            error = "",
        },
    },
    renderer = {
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        highlight_opened_files = "name",
    },
    ui = {
        confirm = {
            default_yes = true,
        }
    },
    on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local FloatPreview = require("float-preview")

        FloatPreview.attach_nvimtree(bufnr)
        local close_wrap = FloatPreview.close_wrap
        local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        vim.keymap.set("n", "<C-t>", close_wrap(api.node.open.tab), opts("Open: New Tab"))
        vim.keymap.set("n", "<C-v>", close_wrap(api.node.open.vertical), opts("Open: Vertical Split"))
        vim.keymap.set("n", "<C-s>", close_wrap(api.node.open.horizontal), opts("Open: Horizontal Split"))
        vim.keymap.set("n", "<CR>", close_wrap(api.node.open.edit), opts("Open"))
        vim.keymap.set("n", "<Tab>", close_wrap(api.node.open.preview), opts("Open"))
        vim.keymap.set("n", "o", close_wrap(api.node.open.edit), opts("Open"))
        vim.keymap.set("n", "O", close_wrap(api.node.open.no_window_picker), opts("Open: No Window Picker"))
        vim.keymap.set("n", "a", close_wrap(api.fs.create), opts("Create"))
        vim.keymap.set("n", "d", close_wrap(api.fs.remove), opts("Delete"))
        vim.keymap.set("n", "r", close_wrap(api.fs.rename), opts("Rename"))
        vim.keymap.set("n", "x", close_wrap(api.fs.cut), opts("Cut"))
        vim.keymap.set("n", "c", close_wrap(api.fs.copy), opts("Copy"))
        vim.keymap.set("n", "p", close_wrap(api.fs.paste), opts("Paste"))
    end
}
