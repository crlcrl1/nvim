return {
    name = "C/C++ run",
    builder = function()
        local os_name = vim.loop.os_uname().sysname
        local output_file = vim.fn.expand("%:p:r")
        if os_name == "Windows" then
            output_file = vim.fn.expand("%:p:r") .. ".exe"
        end
        return {
            cmd = { output_file },
            components = {
                {
                    "dependencies",
                    task_names = { "C/C++ build" }
                },
                "default" },
        }
    end,
    condition = {
        filetype = { "c", "cpp" },
    },
}
