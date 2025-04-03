require("remote-nvim").setup({
    offline_mode = {
        enabled = false,
        no_github = false,
    },
    ssh_config = {
        scp_binary = "rsync -az",
    }
})
