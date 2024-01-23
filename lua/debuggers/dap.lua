local dap = require('dap')
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/chen/debuggers/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
            type = 'server',
            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = {
                source_filetype = 'python',
            },
        })
    else
        cb({
            type = 'executable',
            command = '/home/linuxbrew/.linuxbrew/bin/python3',
            args = { '-m', 'debugpy.adapter' },
            options = {
                source_filetype = 'python',
            },
        })
    end
end

-- TODO: configure java debugging
-- dap.adapters.java = function(callback)
--     -- FIXME:
--     -- Here a function needs to trigger the `vscode.java.startDebugSession` LSP command
--     -- The response to the command must be the `port` used below
--     callback({
--         type = 'server',
--         host = '127.0.0.1',
--         port = port,
--     })
-- end
