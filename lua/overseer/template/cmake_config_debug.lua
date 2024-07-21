local function get_cmake_file(opts)
    return vim.fs.find("CMakeLists.txt", { upward = true, type = "file", path = opts.dir })[1]
end

return {
    name = "CMake config(Debug)",
    builder = function()
        local os_name = vim.loop.os_uname().sysname
        local c_compiler = "gcc"
        local cxx_compiler = "g++"
        if os_name == "Windows" then
            c_compiler = "cl"
            cxx_compiler = "cl"
        end

        return {
            cmd = { "cmake" },
            args = {
                "-DCMAKE_BUILD_TYPE=Debug",
                "-B", "Debug",
                "-S", ".",
                "-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
                "-DCMAKE_C_COMPILER=" .. c_compiler,
                "-DCMAKE_CXX_COMPILER=" .. cxx_compiler,
                "-G", "Ninja"
            },
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
