local M = {}

function M.setup()
    local dap = require("dap")

    local map = function(keys, func, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, keys, func, { desc = "DAP: " .. desc })
    end
    map("<leader>dt", dap.toggle_breakpoint, "[T]oggle Breakpoint")
    map("<leader>dc", dap.continue, "[C]ontinue")
    map("<leader>dr", dap.repl.open, "Open [R]EPL")
    map("<leader>dk", dap.terminate, "[K]ill")

    map("<leader>dso", dap.step_over, "[S]tep [O]ver")
    map("<leader>dsi", dap.step_into, "[S]tep [I]nto")
    map("<leader>dsu", dap.step_out, "[S]tep O[u]t")
    map("<leader>dl", dap.run_last, "Run [L]ast")

    local dapview = require("dap-view")
    dap.listeners.after["launch"]["dap-view"] = function()
        dapview.open()
    end

    dap.listeners.after["event_exited"]["dap-view"] = function()
        dapview.close(true)
    end

    local state = require("dap-view.state")
    local util = require("dap-view.util")
    map("<leader>dv", function()
        dapview.toggle(true)
    end, "Toggle Debug [V]iew")
    map("<leader>dj", function()
        if util.is_buf_valid(state.bufnr) and util.is_win_valid(state.winnr) then
            vim.api.nvim_set_current_win(state.winnr)
        else
            dapview.open()
            vim.api.nvim_set_current_win(state.winnr)
        end
    end, "[J]ump to Debug View")
end

return M
