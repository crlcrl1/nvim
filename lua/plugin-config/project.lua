local status, project = pcall(require, "project_nvim")
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
    detection_methods = {
        "pattern",
    },
    patterns = {
        ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile",
        "package.json", ".sln", "CMakeLists.txt", "init.vim", "Cargo.toml",
        "build.gradle", "settings.gradle", "pom.xml", "go.mod", ".sln", ".slnx",
        "gradle.build.kts", "requirements.txt", "Pipfile", "pyproject.toml", ".csproj",
        "build.xml", "composer.json", "Gemfile", "setup.py", "Package.swift",
        "README.md", "PKGBUILD"
    },
})

local status, telescope = pcall(require, "telescope")
pcall(telescope.load_extension, "projects")
