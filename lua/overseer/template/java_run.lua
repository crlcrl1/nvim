return {
    name = "Java run",
    builder = function()
        local output_class = vim.fn.expand("%:t:r")
        return {
            cmd = { "java" },
            args = { "-cp", "./out", output_class },
            components = {
                {
                    "dependencies",
                    task_names = { "Java build" }
                },
                "default" },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}
