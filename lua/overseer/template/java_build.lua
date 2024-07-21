return {
    name = "Java build",
    builder = function()
        -- Full path to current file (see :help expand())
        local file = vim.fn.expand("%:p")
        return {
            cmd = { "javac" },
            args = { file, "-d", "./out" },
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}
