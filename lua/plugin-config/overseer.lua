require('overseer').setup({
    templates = {
        "zig_run",
        "run_script",
        "cargo",
        "make",
        "cpp_build",
        "cpp_run",
        "java_build",
        "java_run",
        "cmake_build_debug",
        "cmake_build_release",
        "cmake_config_release",
        "cmake_config_debug",
    },
})
