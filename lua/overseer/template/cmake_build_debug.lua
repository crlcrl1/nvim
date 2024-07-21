local function get_cmake_file(opts)
    return vim.fs.find("CMakeLists.txt", { upward = true, type = "file", path = opts.dir })[1]
end

return {
    name = "CMake build(Debug)",
    builder = function()
        return {
            cmd = { "cmake" },
            args = { "--build", "./Debug" },
        }
    end,

    condition = {
        callback = function(opts)
            if vim.fn.executable("cmake") == 0 then
                return false, 'Command "cmake" not found'
            end
            if not get_cmake_file(opts) then
                return false, "No CMakeLists.txt file found"
            end
            return true
        end,
    },
}
