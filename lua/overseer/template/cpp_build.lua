return {
    name = "C/C++ build",
    builder = function()
        -- Full path to current file (see :help expand())
        local file = vim.fn.expand("%:p")
        local file_type = vim.bo.filetype
        local os_name = vim.loop.os_uname().sysname
        local output_file = vim.fn.expand("%:t:r")
        local compiler = "g++"
        if file_type == "c" then
            compiler = "gcc"
        end
        if os_name == "Windows" then
            compiler = "cl"
            output_file = vim.fn.expand("%:t:r") .. ".exe"
        end
        return {
            cmd = { compiler },
            args = { file, "-o", output_file, "-g" },
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "c", "cpp" },
    },
}
