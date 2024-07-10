local opt = {
    -- wrap nvimtree commands
    wrap_nvimtree_commands = true,
    -- lines for scroll
    scroll_lines = 20,
    -- window config
    window = {
        style = "minimal",
        relative = "win",
        border = "rounded",
        wrap = false,
    },
    mapping = {
        -- scroll down float buffer
        down = { "<C-f>" },
        -- scroll up float buffer
        up = { "<C-e>" },
        -- enable/disable float windows
        toggle = { "<C-x>" },
    },
    -- hooks if return false preview doesn't shown
    hooks = {
        pre_open = function(path)
            -- if file > 5 MB or not text -> not preview
            local size = require("float-preview.utils").get_size(path)
            if type(size) ~= "number" then
                return false
            end
            local is_text = require("float-preview.utils").is_text(path)
            return size < 5 and is_text
        end,
        post_open = function(bufnr)
            return true
        end,
    },
}

require('float-preview').setup(opt)
