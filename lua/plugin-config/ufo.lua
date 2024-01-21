vim.cmd([[highlight AdCustomFold guifg=#bf8040]])
local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (" 󰁂 %d "):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0

    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end

    -- Second line
    local lines = vim.api.nvim_buf_get_lines(0, lnum, lnum + 1, false)
    local secondLine = nil
    if #lines == 1 then
        secondLine = lines[1]
    elseif #lines > 1 then
        secondLine = lines[2]
    end
    if secondLine ~= nil then
        table.insert(newVirtText, { secondLine, "AdCustomFold" })
    end

    table.insert(newVirtText, { suffix, "MoreMsg" })

    return newVirtText
end

require("ufo").setup({
    provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
    end,
    fold_virt_text_handler = handler,
})
