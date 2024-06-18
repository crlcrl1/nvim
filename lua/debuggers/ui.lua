local dap = require("dap")
local dapui = require("dapui")

require("nvim-dap-virtual-text").setup({
    enabled = true,
    enable_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = false,
    show_stop_reason = true,
    commented = false,
    only_first_definition = true,
    all_references = false,
    filter_references_pattern = '<module',
    virt_text_pos = 'eol',
    all_frames = false,
    virt_lines = false,
    virt_text_win_col = nil
})

local dap_breakpoint_color = {
    breakpoint = {
        ctermbg = 0,
        bg = '#690808'
    },
    logpoing = {
        ctermbg = 0,
        bg = '#61afef'
    },
    stopped = {
        ctermbg = 0,
        bg = '#186E00'
    },
}

vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

local dap_breakpoint = {
    error = {
        text = "",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    condition = {
        text = '',
        texthl = 'DapBreakpoint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
    },
    rejected = {
        text = "",
        texthl = "DapBreakpint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    logpoint = {
        text = '',
        texthl = 'DapLogPoint',
        linehl = 'DapLogPoint',
        numhl = 'DapLogPoint',
    },
    stopped = {
        text = '',
        texthl = 'DapStopped',
        linehl = 'DapStopped',
        numhl = 'DapStopped',
    },
}

vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

dapui.setup({
    element_mappings = {
        scopes = {
            edit = "e",
            repl = "r",
        },
        watches = {
            edit = "e",
            repl = "r",
        },
        stacks = {
            open = "o",
        },
        breakpoints = {
            open = "o",
            toggle = "t",
        },
    },

    layouts = {
        {
            elements = {
                "stacks",
                "watches",
                "breakpoints",
                "scopes",
            },
            size = 0.30,
            position = "left",
        },
        {
            elements = {
                "console",
                "repl",
            },
            size = 0.25,
            position = "bottom",
        },
    },

    floating = {
        max_height = nil,   -- These can be integers or a float between 0 and 1.
        max_width = nil,    -- Floats will be treated as percentage of your screen.
        border = "rounded", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
