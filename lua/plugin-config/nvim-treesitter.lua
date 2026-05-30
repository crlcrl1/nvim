local treesitter = require('nvim-treesitter')

local ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'cpp' }

treesitter.setup {
    install_dir = vim.fn.stdpath('data') .. '/site',
}

local available = {}
for _, lang in ipairs(treesitter.get_available()) do
    available[lang] = true
end

local installed = {}
local function refresh_installed()
    installed = {}
    for _, lang in ipairs(treesitter.get_installed('parsers')) do
        installed[lang] = true
    end
end

local pending_buffers = {}
local installing = {}

local function lang_for_buf(buf)
    local filetype = vim.bo[buf].filetype
    if filetype == '' then
        return nil
    end

    return vim.treesitter.language.get_lang(filetype)
end

local function enable_treesitter(buf, lang)
    if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_buf_is_loaded(buf) then
        return
    end

    if lang_for_buf(buf) ~= lang then
        return
    end

    local ok = pcall(vim.treesitter.language.add, lang)
    if not ok then
        return
    end

    pcall(vim.treesitter.stop, buf)

    if pcall(vim.treesitter.start, buf, lang) then
        vim.api.nvim__redraw({ buf = buf, valid = false, flush = false })
    end
end

local function add_pending_buffer(lang, buf)
    pending_buffers[lang] = pending_buffers[lang] or {}
    pending_buffers[lang][buf] = true
end

local function enable_pending_buffers(lang)
    local buffers = pending_buffers[lang]
    pending_buffers[lang] = nil

    for buf in pairs(buffers or {}) do
        enable_treesitter(buf, lang)
    end
end

local function install_missing(languages)
    local missing = {}

    for _, lang in ipairs(languages) do
        if available[lang] and not installed[lang] and not installing[lang] then
            installing[lang] = true
            table.insert(missing, lang)
        end
    end

    if #missing == 0 then
        return
    end

    treesitter.install(missing, { summary = true }):await(function(err, ok)
        vim.schedule(function()
            refresh_installed()

            for _, lang in ipairs(missing) do
                installing[lang] = nil

                if installed[lang] then
                    vim.defer_fn(function()
                        enable_pending_buffers(lang)
                    end, 50)
                end
            end

            if err or ok == false then
                vim.notify('Failed to install some tree-sitter parsers', vim.log.levels.WARN)
            end
        end)
    end)
end

refresh_installed()
install_missing(ensure_installed)

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('user_treesitter', { clear = true }),
    pattern = '*',
    callback = function(ev)
        local lang = lang_for_buf(ev.buf)
        if not lang then
            return
        end

        if installed[lang] then
            enable_treesitter(ev.buf, lang)
        elseif available[lang] then
            add_pending_buffer(lang, ev.buf)
            install_missing { lang }
        else
            enable_treesitter(ev.buf, lang)
        end
    end,
})
