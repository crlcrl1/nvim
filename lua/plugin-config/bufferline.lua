vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        diagnostics = "coc",
        -- 左侧让出 nvim-tree 的位置
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "center"
            },
            {
                filetype = "vista",
                text = "Outline",
                highlight = "Directory",
                text_align = "center"
            }
        },

        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                    or (e == "warning" and " " or " ")
                s = s .. n .. sym
            end
            return s
        end
    }
}
