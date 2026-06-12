local M = {}

function M.setup()
    local conform = require("conform")

    conform.setup({
        notify_on_error = false,
        format_on_save = function(bufnr)
            local disable_filetypes = { c = true, cpp = true }
            if disable_filetypes[vim.bo[bufnr].filetype] then
                return nil
            else
                return { timeout_ms = 500, lsp_format = "fallback" }
            end
        end,
        formatters_by_ft = {
            lua = { "stylua" },
        },
    })

    vim.keymap.set("", "<leader>f", function()
        conform.format({ async = true, lsp_format = "fallback" })
    end, { desc = "[F]ormat buffer" })

    -- Also run format on BufWritePre (conform handles the async/sync split internally)
    vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(args)
            conform.format({ bufnr = args.buf, lsp_format = "fallback", timeout_ms = 500 })
        end,
    })
end

return M
